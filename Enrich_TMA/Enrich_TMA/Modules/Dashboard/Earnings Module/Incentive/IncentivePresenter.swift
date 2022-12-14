//
//  IncentivePresenter.swift
//  Enrich_TMA
//
//  Created by Harshal on 21/12/21.
//  Copyright (c) 2021 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol IncentivePresentationLogic
{
  func presentSomething(response: Incentive.Something.Response)
}

class IncentivePresenter: IncentivePresentationLogic
{
  weak var viewController: IncentiveDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Incentive.Something.Response)
  {
    let viewModel = Incentive.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
