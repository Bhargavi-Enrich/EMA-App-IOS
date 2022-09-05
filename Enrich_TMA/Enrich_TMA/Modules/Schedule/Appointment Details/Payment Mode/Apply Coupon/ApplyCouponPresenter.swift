//
//  ApplyCouponPresenter.swift
//  Enrich_TMA
//
//  Created by Harshal on 20/03/20.
//  Copyright (c) 2020 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ApplyCouponPresentationLogic {
    func presentSuccess<T: Decodable>(response: T)
    func presentError(responseError: String?)
}

class ApplyCouponPresenter: ApplyCouponPresentationLogic {
    weak var viewController: ApplyCouponDisplayLogic?

    // MARK: Do something
    func presentSuccess<T: Decodable>(response: T) {
        viewController?.displaySuccess(viewModel: response)
    }

    func presentError(responseError: String?) {
        viewController?.displayError(errorMessage: responseError)
    }
}