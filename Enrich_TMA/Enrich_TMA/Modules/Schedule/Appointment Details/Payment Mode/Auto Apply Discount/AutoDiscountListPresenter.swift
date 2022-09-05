//
//  AutoDiscountListPresenter.swift
//  Enrich_TMA
//
//  Created by Harshal on 31/07/20.
//  Copyright (c) 2020 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol AutoDiscountListPresentationLogic
{
    func presentSuccess<T: Decodable>(response: T)
    func presentError(responseError: String?)
}

class AutoDiscountListPresenter: AutoDiscountListPresentationLogic
{
    weak var viewController: AutoDiscountListDisplayLogic?
    
    // MARK: Do something
    func presentSuccess<T: Decodable>(response: T) {
        viewController?.displaySuccess(viewModel: response)
    }
    
    func presentError(responseError: String?) {
        viewController?.displayError(errorMessage: responseError)
    }
}

