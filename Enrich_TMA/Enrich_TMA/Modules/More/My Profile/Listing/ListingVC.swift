//
//  ListingViewController.swift
//  Enrich_SMA
//
//  Created by Harshal on 14/07/20.
//  Copyright (c) 2020 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ListingDisplayLogic: class {
    func displaySuccess<T: Decodable> (viewModel: T)
    func displayError(errorMessage: String?)
}

class ListingVC: UIViewController, ListingDisplayLogic {
    var interactor: ListingBusinessLogic?

    // MARK: Object lifecycle

    var screenTitle = ""
    var listing = [String]()
    var services = [ServiceListingModel]()

    var employeeId: String?
    
    var pageNo = 1
    var limit = 15
    var totalRecords = 0
    
    var tableViewContentHeight: CGFloat {
        tableView.layoutIfNeeded()
        return tableView.contentSize.height
    }

    @IBOutlet weak private var lblTitle: UILabel!
    @IBOutlet weak private var lblNoRecords: UILabel!
    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak private var tableViewHeight: NSLayoutConstraint!
    
    var viewDismissBlock: ((Bool) -> Void)?

    var listingType: ListingType = .services

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = ListingInteractor()
        let presenter = ListingPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblTitle.text = listingType.rawValue
        tableView.separatorInset = UIEdgeInsets(top: 0, left: UIScreen.main.bounds.width, bottom: 0, right: 0)
        tableView.register(UINib(nibName: CellIdentifier.serviceListingCell, bundle: nil), forCellReuseIdentifier: CellIdentifier.serviceListingCell)
        lblNoRecords.isHidden = true
        switch listingType {
        case .services:
            getServiceList(employeeId: employeeId)
        case .shifts:
            getRosterDetails()
        case .customerCount:
            tableViewHeight.constant = tableViewContentHeight + 20
        default:
            break
        }
    }

    @IBAction func actionClose(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        viewDismissBlock?(true)
    }
}

extension ListingVC {

    func getServiceList(employeeId: String?) {
        
        if let userData = UserDefaults.standard.value(MyProfile.GetUserProfile.UserData.self, forKey: UserDefauiltsKeys.k_Key_LoginUser) {
            EZLoadingActivity.show("Loading...", disableUI: true)
            let request = MyProfile.GetServiceList.Request(
                page_no: pageNo, technician_id: employeeId,
                limit: limit, salon_id: userData.salon_id,
                service_type: "", gender: "",
                search_text: "", is_dependant_service: nil, customer_id: nil)
            interactor?.doPostServiceListData(request: request)
        }
    }

    func getRosterDetails() {

        if let startDate = Date().startOfWeek, let endDate = Date().endOfWeek {

            if let userData = UserDefaults.standard.value(MyProfile.GetUserProfile.UserData.self, forKey: UserDefauiltsKeys.k_Key_LoginUser) {

                EZLoadingActivity.show("Loading...", disableUI: true)

                let id = employeeId ?? "0"

                let request = MyProfile.GetRosterDetails.Request(salon_code: userData.base_salon_code ?? "", fromDate: startDate.dayYearMonthDate, toDate: endDate.dayYearMonthDate, employee_id: id)
                interactor?.doGetRosterData(request: request, method: .post)
            }
        }
    }

    func displaySuccess<T>(viewModel: T) where T: Decodable {
        print("Response: \(viewModel)")
        EZLoadingActivity.hide()

        if let model = viewModel as? MyProfile.GetServiceList.Response, model.status == true {
            self.totalRecords = model.data?.total_records ?? 0
            if pageNo == 1 {
                self.listing.removeAll()
            }
            model.data?.service_list?.forEach {
                self.listing.append($0.name ?? "")
            }
            lblNoRecords.isHidden = !listing.isEmpty
            self.tableView.reloadData()
        }
        else if let model = viewModel as? MyProfile.GetRosterDetails.Response, model.status == true {
            self.listing.removeAll()

            model.data?.forEach {

                let shift: String

                if let dateString = $0.date,
                    let date = dateString.getDateFromString() {
                    if let isLeave = $0.is_leave, isLeave == 1 {
                        shift = "\(date.dayMonthYear)  |  \($0.leave_type ?? "")"
                    }
                    else {
                        shift = "\(date.dayMonthYear)  |  \($0.shift_name ?? "-")  |  \($0.start_time ?? "-") - \($0.end_time ?? "-")"
                    }

                    self.listing.append(shift)
                }
            }
            lblNoRecords.isHidden = !listing.isEmpty
            self.tableView.reloadData()
        }
    }

    func displayError(errorMessage: String?) {
        EZLoadingActivity.hide()
        print("Failed: \(errorMessage ?? "")")
        showAlert(alertTitle: alertTitle, alertMessage: errorMessage ?? "Request Failed")
    }

}

extension ListingVC: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listingType == .appointmentServices {
            return services.count
        }
        else {
            return listing.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if listingType == .appointmentServices {

            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.serviceListingCell, for: indexPath) as? ServiceListingCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            cell.configureCell(model: services[indexPath.row])
            return cell

        }
        else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.listingCell, for: indexPath) as? ListingCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            if listingType == .services {
                cell.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            }
            else {
                cell.separatorInset = UIEdgeInsets(top: 0, left: UIScreen.main.bounds.width, bottom: 0, right: 0)
            }
            cell.configureCell(text: listing[indexPath.row])
            return cell
        }

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if listingType == .shifts {
            return 55
        }
        else if  listingType == .services {
            return 40
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("Row index: \(indexPath.row)")
        
        if listingType == .services {
            if indexPath.row == (listing.count - 1) &&
                listing.count < totalRecords {
                pageNo += 1
                self.getServiceList(employeeId: employeeId)
            }
        }
    }
}