//
//  AwardsPresenter.swift
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

protocol AwardsPresentationLogic
{
  func presentSomething(response: Awards.Something.Response)
}

class AwardsPresenter: AwardsPresentationLogic
{
  weak var viewController: AwardsDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Awards.Something.Response)
  {
    let viewModel = Awards.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
