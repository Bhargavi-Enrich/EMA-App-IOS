//
//  DashboardPresenter.swift
//  Enrich_TMA
//
//  Created by Harshal Patil on 15/10/19.
//  Copyright (c) 2019 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DashboardPresentationLogic {
    func presentSuccess<T: Decodable>(response: T)
    func presentError(responseError: String?)
}

class DashboardPresenter: DashboardPresentationLogic {
    weak var viewController: DashboardDisplayLogic?

    // MARK: Do something

    func presentSuccess<T>(response: T) where T: Decodable {
        viewController?.displaySuccess(viewModel: response)
    }

    func presentError(responseError: String?) {
        viewController?.displayError(errorMessage: responseError)
    }
}
