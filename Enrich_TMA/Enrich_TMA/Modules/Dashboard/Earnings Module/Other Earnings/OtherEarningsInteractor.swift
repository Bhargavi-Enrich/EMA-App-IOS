//
//  OtherEarningsInteractor.swift
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

protocol OtherEarningsBusinessLogic
{
  func doSomething(request: OtherEarnings.Something.Request)
}

protocol OtherEarningsDataStore
{
  //var name: String { get set }
}

class OtherEarningsInteractor: OtherEarningsBusinessLogic, OtherEarningsDataStore
{
  var presenter: OtherEarningsPresentationLogic?
  var worker: OtherEarningsWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: OtherEarnings.Something.Request)
  {
    worker = OtherEarningsWorker()
    worker?.doSomeWork()
    
    let response = OtherEarnings.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
