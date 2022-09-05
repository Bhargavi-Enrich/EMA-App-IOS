//
//  PettyCashListingPresenter.swift
//  Enrich_TMA
//
//  Created by Harshal Patil on 27/11/19.
//  Copyright (c) 2019 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol PettyCashListingPresentationLogic {
    func presentSuccess<T: Decodable>(response: T)
    func presentError(responseError: String?)
}

class PettyCashListingPresenter: PettyCashListingPresentationLogic {
    weak var viewController: PettyCashListingDisplayLogic?

    // MARK: Do something

    func presentSuccess<T: Decodable>(response: T) {
        viewController?.displaySuccess(viewModel: response)
    }
    func presentError(responseError: String? ) {
        viewController?.displayError(errorMessage: responseError)
    }
}