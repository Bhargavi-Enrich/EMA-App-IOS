//
//  ConfirmCustomerOTPPresenter.swift
//  Enrich_TMA
//
//  Created by Harshal Patil on 26/12/19.
//  Copyright (c) 2019 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ConfirmCustomerOTPPresentationLogic {
    func presentResendOTPSuccess<T: Decodable>(response: T)
    func presentConfirmOTPSuccess<T: Decodable>(response: T)
    func presentError(responseError: String?)
}

class ConfirmCustomerOTPPresenter: ConfirmCustomerOTPPresentationLogic {
    weak var viewController: ConfirmCustomerOTPDisplayLogic?

    // MARK: Do something

    func presentResendOTPSuccess<T: Decodable>(response: T) {
        viewController?.displaySuccess(viewModel: response)
    }
    func presentError(responseError: String?) {
        viewController?.displayError(errorMessage: responseError)
    }

    func presentConfirmOTPSuccess<T: Decodable>(response: T) {
        viewController?.displaySuccess(viewModel: response)
    }

}