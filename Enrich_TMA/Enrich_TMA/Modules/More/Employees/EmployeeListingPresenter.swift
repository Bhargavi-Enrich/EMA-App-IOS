//
//  EmployeeListingPresenter.swift
//  Enrich_TMA
//
//  Created by Harshal Patil on 22/10/19.
//  Copyright (c) 2019 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol EmployeeListingPresentationLogic {
    func presentGetEmployeeListSuccess<T: Decodable>(response: T)
    func presentGetEmployeeListError(responseError: String?)
}

class EmployeeListingPresenter: EmployeeListingPresentationLogic {
  weak var viewController: EmployeeListingDisplayLogic?

  // MARK: Do something

    func presentGetEmployeeListSuccess<T>(response: T) where T: Decodable {
        viewController?.displaySuccess(viewModel: response)
    }

    func presentGetEmployeeListError(responseError: String?) {
        viewController?.displayError(errorMessage: responseError)
    }
}