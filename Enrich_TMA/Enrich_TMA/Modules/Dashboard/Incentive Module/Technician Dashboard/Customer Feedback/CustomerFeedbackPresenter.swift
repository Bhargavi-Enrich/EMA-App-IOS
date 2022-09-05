//
//  CustomerFeedbackPresenter.swift
//  Enrich_TMA
//
//  Created by Harshal on 05/08/21.
//  Copyright (c) 2021 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CustomerFeedbackPresentationLogic
{
  func presentSomething(response: CustomerFeedback.Something.Response)
}

class CustomerFeedbackPresenter: CustomerFeedbackPresentationLogic
{
  weak var viewController: CustomerFeedbackDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: CustomerFeedback.Something.Response)
  {
    let viewModel = CustomerFeedback.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}