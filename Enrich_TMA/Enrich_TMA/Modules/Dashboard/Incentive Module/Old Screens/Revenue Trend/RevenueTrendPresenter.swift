//
//  RevenueTrendPresenter.swift
//  Enrich_TMA
//
//  Created by Harshal on 18/02/21.
//  Copyright (c) 2021 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol RevenueTrendPresentationLogic
{
  func presentSomething(response: RevenueTrend.Something.Response)
}

class RevenueTrendPresenter: RevenueTrendPresentationLogic
{
  weak var viewController: RevenueTrendDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: RevenueTrend.Something.Response)
  {
    let viewModel = RevenueTrend.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}