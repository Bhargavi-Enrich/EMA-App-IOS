//
//  SendPaymentLinkViewController.swift
//  Enrich_TMA
//
//  Created by Harshal on 09/06/20.
//  Copyright (c) 2020 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SendPaymentLinkDisplayLogic: class {
    func displaySuccess<T: Decodable> (viewModel: T)
    func displayError(errorMessage: String?)
}

class SendPaymentLinkVC: UIViewController, SendPaymentLinkDisplayLogic {
    var interactor: SendPaymentLinkBusinessLogic?

    // MARK: Object lifecycle

    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var txtfMobileNo: UITextField!

    var appointment_id: Int64?
    var quote_id: String?
    var onDoneBlock: ((Bool) -> Void)?

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
        let interactor = SendPaymentLinkInteractor()
        let presenter = SendPaymentLinkPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        txtfMobileNo.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppDelegate.OrientationLock.lock(to: UIInterfaceOrientationMask.portrait,
                                         andRotateTo: UIInterfaceOrientation.portrait)
        KeyboardAnimation.sharedInstance.beginKeyboardObservation(self.view)
        KeyboardAnimation.sharedInstance.extraBottomSpace = 90
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        KeyboardAnimation.sharedInstance.endKeyboardObservation()
    }

    @IBAction func actionSend(_ sender: UIButton) {
        callSendPaymentLinkAPI()
    }

    @IBAction func actionClose(_ sender: UIButton) {
        onDoneBlock?(false)
        self.dismiss(animated: false, completion: nil)
    }

    // MARK: Do something
}

extension SendPaymentLinkVC {

    func callSendPaymentLinkAPI() {
        if let userData = UserDefaults.standard.value(
            MyProfile.GetUserProfile.UserData.self,
            forKey: UserDefauiltsKeys.k_Key_LoginUser) {
            EZLoadingActivity.show("Loading...", disableUI: true)
            let request = SendPaymentLink.PaymentLink.Request(
                appointment_id: appointment_id,
                mobile: self.txtfMobileNo.text,
                quote_id: quote_id,
                salon_code: userData.base_salon_code,
                is_custom: true,
                pos_request: true)
            interactor?.doSendPaymentLink(request: request)
        }
    }

    func displaySuccess<T: Decodable> (viewModel: T) {
        EZLoadingActivity.hide()
        if let model = viewModel as? SendPaymentLink.PaymentLink.Response {
            if model.status == true {

                self.showToast(alertTitle: alertTitle, message: model.message ?? "Success", seconds: toastMessageDuration)

                DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
                    self.dismiss(animated: true) {
                        self.onDoneBlock?(true)
                    }
                }
            }
            else {
                showAlert(alertTitle: alertTitle, alertMessage: model.message ?? "Request Failed")
            }
        }
    }

    func displayError(errorMessage: String?) {
        EZLoadingActivity.hide()
        print("Failed: \(errorMessage ?? "")")
        showAlert(alertTitle: alertTitle, alertMessage: errorMessage ?? "Request Failed")
    }
}

extension SendPaymentLinkVC {

    @objc func editingChanged(_ textField: UITextField) {
        btnSend.isEnabled = false
        let no = (txtfMobileNo.text ?? "").trim()
        if !no.isEmpty {
            self.btnSend.isEnabled = true
        }
    }
}