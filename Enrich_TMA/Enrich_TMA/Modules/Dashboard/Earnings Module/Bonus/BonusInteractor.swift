//
//  BonusInteractor.swift
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

protocol BonusBusinessLogic
{
  func doSomething(request: Bonus.Something.Request)
}

protocol BonusDataStore
{
  //var name: String { get set }
}

class BonusInteractor: BonusBusinessLogic, BonusDataStore
{
  var presenter: BonusPresentationLogic?
  var worker: BonusWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Bonus.Something.Request)
  {
    worker = BonusWorker()
    worker?.doSomeWork()
    
    let response = Bonus.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
