//
//  BillOfMaterialViewController.swift
//  Enrich_TMA
//
//  Created by Harshal Patil on 05/12/19.
//  Copyright (c) 2019 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol BillOfMaterialDisplayLogic: class {
    func displaySuccess<T: Decodable> (viewModel: T)
    func displayError(errorMessage: String?)
}

class BillOfMaterialVC: UIViewController, BillOfMaterialDisplayLogic {
    var interactor: BillOfMaterialBusinessLogic?

    @IBOutlet weak private var productTableView: UITableView!
    @IBOutlet weak private var lblNoProducts: UILabel!

    var viewDismissBlock: ((Bool) -> Void)?

    var selectedIndex = 0

    // MARK: Object lifecycle

    var BOMProduct: BillOfMaterialCellModel?

    var relatedProducts = [BillOfMaterial.RelatedBOMProducts.Product_links]()

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
        let interactor = BillOfMaterialInteractor()
        let presenter = BillOfMaterialPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        getRelatedProducts()

        productTableView.register(UINib(nibName: CellIdentifier.bomProductCell, bundle: nil), forCellReuseIdentifier: CellIdentifier.bomProductCell)

        productTableView.separatorInset = UIEdgeInsets(top: 0, left: UIScreen.main.bounds.width, bottom: 0, right: 0)
        getRelatedProducts()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        AppDelegate.OrientationLock.lock(to: UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }

    @IBAction func actionApply(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        if !relatedProducts.isEmpty {
            BOMProduct?.productCode = relatedProducts[selectedIndex].sku ?? ""
            BOMProduct?.productName = relatedProducts[selectedIndex].name ?? ""
        }
        viewDismissBlock?(true)
    }

    @IBAction func actionClose(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        viewDismissBlock?(false)
    }

    // MARK: Do something

    func getRelatedProducts() {
        if let code = BOMProduct?.productCode {
            interactor?.doGetAppointmentList(productCode: code)
        }
    }

}

extension BillOfMaterialVC {

    func displaySuccess<T>(viewModel: T) where T: Decodable {
        EZLoadingActivity.hide()
        print("Response: \(viewModel)")

        if let model = viewModel as? BillOfMaterial.RelatedBOMProducts.Response {
            relatedProducts.removeAll()
            relatedProducts.append(contentsOf: model.product_links ?? [])
            lblNoProducts.isHidden = !relatedProducts.isEmpty
            productTableView.reloadData()
        }
    }

    func displayError(errorMessage: String?) {
        EZLoadingActivity.hide()
        print("Failed: \(errorMessage ?? "")")
       // showAlert(alertTitle: alertTitle, alertMessage: errorMessage ?? "Request Failed")
    }
}

extension BillOfMaterialVC: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return relatedProducts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.bomProductCell, for: indexPath) as? BOMProductCell else {
            return UITableViewCell()
        }
        cell.configureCell(title: relatedProducts[indexPath.row].name ?? "", isSelected: indexPath.row == selectedIndex)
        productTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        cell.selectionStyle = .none
        return cell

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        tableView.reloadData()
    }
}
