//
//  PackageListingViewController.swift
//  Enrich_TMA
//
//  Created by Harshal on 06/03/20.
//  Copyright (c) 2020 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol PackageListingDisplayLogic: class {
    func displaySuccess<T: Decodable> (viewModel: T)
    func displayError(errorMessage: String?)
}

class PackageListingVC: UIViewController, PackageListingDisplayLogic {
    var interactor: PackageListingBusinessLogic?

    @IBOutlet private weak var tableView: UITableView!

    var arrValuePackages: [PackageListing.OffersValuePackages.Package_listValues] = []

    // MARK: Object lifecycle

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
        let interactor = PackageListingInteractor()
        let presenter = PackageListingPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }

    // MARK: View lifecycle

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getValuePackagesAPI()
        addSOSButton()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppDelegate.OrientationLock.lock(to: UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.addCustomBackButton(title: "Packages")
        self.tableView.separatorColor = .clear
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func addSOSButton() {
        guard let sosImg = UIImage(named: "SOS") else {
            return
        }
        let sosButton = UIBarButtonItem(image: sosImg, style: .plain, target: self, action: #selector(didTapSOSButton))
        sosButton.tintColor = UIColor.black
        navigationItem.title = ""
        if showSOS {
            navigationItem.rightBarButtonItems = [sosButton]
        }
    }

    @objc func didTapSOSButton() {
        SOSFactory.shared.raiseSOSRequest()
    }

    // MARK: - Call API - Search product listing

    func getValuePackagesAPI() {
        EZLoadingActivity.show("", disableUI: true)
        interactor?.doGetOffersValuePackages()
    }

    func displaySuccess<T>(viewModel: T) where T: Decodable {
        if T.self == PackageListing.OffersValuePackages.Response.self {
            self.parseValuePackages(viewModel: viewModel)
        }

    }

    func displayError(errorMessage: String?) {
        EZLoadingActivity.hide()
        DispatchQueue.main.async { [unowned self] in
            self.showAlert(alertTitle: alertTitle, alertMessage: errorMessage ?? "")
        }
    }
    func parseValuePackages<T: Decodable>(viewModel: T) {
        if let obj = viewModel as? PackageListing.OffersValuePackages.Response {
            if let status = obj.status, status == true {
                self.arrValuePackages = obj.data?.package_list ?? []
            }
            else {
                self.showToast(alertTitle: alertTitle, message: obj.message ?? "", seconds: toastMessageDuration)
            }
        }
        self.tableView.reloadData()
        EZLoadingActivity.hide()

    }

}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension PackageListingVC: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrValuePackages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var strLink = ""

        if self.arrValuePackages.count > indexPath.row {
            let model = self.arrValuePackages[indexPath.row]
            strLink = !(model.swatch_image ?? "").isEmpty ? model.swatch_image ?? "" : model.image ?? ""
        }

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OfferCell", for: indexPath) as? OfferCell else {
            return UITableViewCell()
        }
        //OfferImage
        cell.offerImage.image = UIImage(named: "OfferImage")
        if !strLink.isEmpty {

            let url = URL(string: strLink)
            cell.offerImage.kf.setImage(with: url, placeholder: UIImage(named: "OfferImage"), options: nil, progressBlock: nil, completionHandler: nil)
        }
        cell.selectionStyle = .none

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (tableView.frame.size.width * 0.5)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selection")

        if self.arrValuePackages.count > indexPath.row {
            let model = self.arrValuePackages[indexPath.row]
            let vc = PackageDetailVC.instantiate(fromAppStoryboard: .Catalogue)
            vc.modelObj = model
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// MARK: -
extension PackageListingVC {
    func configureSection(idetifier: SectionIdentifier, items: Int, data: Any) -> SectionConfiguration {

        let margin: CGFloat = is_iPAD ? 25 : 15
        var cellWidth: CGFloat = tableView.frame.size.width
        var cellHeight: CGFloat = is_iPAD ? 70 : 50

        switch idetifier {

        case .blog_Topics:

            cellWidth = is_iPAD ? 150 : 120
            return SectionConfiguration(title: idetifier.rawValue, subTitle: "", cellHeight: cellHeight, cellWidth: cellWidth, showHeader: false, showFooter: false, headerHeight: 0, footerHeight: 0, leftMargin: margin, rightMarging: 0, isPagingEnabled: false, textFont: nil, textColor: .black, items: items, identifier: idetifier, data: data)

        case .availableCoupons:

            cellHeight = is_iPAD ? 150 : 120
            let cellWidth: CGFloat = is_iPAD ? ((tableView.frame.size.width - 75) / 2) + 10: (tableView.frame.size.width - 30)

            return SectionConfiguration(title: idetifier.rawValue, subTitle: "", cellHeight: cellHeight, cellWidth: cellWidth, showHeader: false, showFooter: false, headerHeight: 0, footerHeight: 0, leftMargin: margin, rightMarging: margin, isPagingEnabled: false, textFont: nil, textColor: .black, items: items, identifier: idetifier, data: data)

        default :
            return SectionConfiguration(title: idetifier.rawValue, subTitle: "", cellHeight: 0, cellWidth: cellWidth, showHeader: false, showFooter: false, headerHeight: 0, footerHeight: 0, leftMargin: 0, rightMarging: 0, isPagingEnabled: false, textFont: nil, textColor: .black, items: items, identifier: idetifier, data: data)
        }
    }

    // MARK: Create
    func parseData() -> [FilterKeys] {
        var arrForKeysValues: [FilterKeys] = []
        arrForKeysValues.append(FilterKeys(field: "is_active", value: false, type: "neq"))
        arrForKeysValues.append(FilterKeys(field: "offer_applicable", value: "cma", type: "finset"))
        arrForKeysValues.append(FilterKeys(field: "use_auto_generation", value: 0, type: "eq"))
        arrForKeysValues.append(FilterKeys(field: "from_date", value: Date().dayYearMonthDate + " 00:00:00", type: "lteq"))
        arrForKeysValues.append(FilterKeys(field: "to_date", value: Date().dayYearMonthDate + " 00:00:00", type: "gteq"))

        arrForKeysValues.append(FilterKeys(field: "code", value: "", type: "neq"))
        return arrForKeysValues
    }
}
