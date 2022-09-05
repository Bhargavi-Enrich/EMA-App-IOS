//
//  MyDetailsViewController.swift
//  Enrich_TMA
//
//  Created by Harshal on 22/02/21.
//  Copyright (c) 2021 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MyDetailsDisplayLogic: class
{
    func displaySomething(viewModel: MyDetails.Something.ViewModel)
}

class MyDetailsVC: UIViewController, MyDetailsDisplayLogic
{
    var interactor: MyDetailsBusinessLogic?
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = MyDetailsInteractor()
        let presenter = MyDetailsPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        doSomething()
        tableView.register(UINib(nibName: CellIdentifier.incentiveMyDetailsCell, bundle: nil), forCellReuseIdentifier: CellIdentifier.incentiveMyDetailsCell)
        tableView.register(UINib(nibName: CellIdentifier.incentiveCommonHeaderCell, bundle: nil), forCellReuseIdentifier: CellIdentifier.incentiveCommonHeaderCell)
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.addCustomBackButton(title: "My Details")
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething()
    {
        let request = MyDetails.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: MyDetails.Something.ViewModel)
    {
        //nameTextField.text = viewModel.name
    }
}

extension MyDetailsVC: IncentiveHeaderDelegate {
    
    func actionViewAll(identifier: SectionIdentifier) {
        
        switch identifier {
        case .ctcDetails:
            let vc = CTCDetailsVC.instantiate(fromAppStoryboard: .Incentive)
            self.navigationController?.pushViewController(vc, animated: true)
        case .attendanceDetails:
            let vc = AttendanceDetailsVC.instantiate(fromAppStoryboard: .Incentive)
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}

extension MyDetailsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.incentiveMyDetailsCell, for: indexPath) as? IncentiveMyDetailsCell else {
            return UITableViewCell()
        }
        if indexPath.section == 0 {
            cell.configureCell(showGradientView: true, showCurrentMonthLabel: true)
        }
        else if indexPath.section == 1 {
            cell.configureCell(showGradientView: false, showCurrentMonthLabel: true)
        }
        else {
            cell.configureCell(showGradientView: false, showCurrentMonthLabel: false)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.incentiveCommonHeaderCell) as? IncentiveCommonHeaderCell else {
            return UITableViewCell()
        }
        let title = section == 0 ? "Leave Details" : section == 1 ? "Attendance Details" : "CTC Details"
        cell.delegate = self
        cell.setTitle(title: title, identifier: section == 1 ? .attendanceDetails : .ctcDetails, showViewAll: section == 0 ? false : true)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selection")
    }
}