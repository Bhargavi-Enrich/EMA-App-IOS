//
//  TechnicianDashboardInteractor.swift
//  Enrich_TMA
//
//  Created by Harshal on 03/08/21.
//  Copyright (c) 2021 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol TechnicianDashboardBusinessLogic
{
  func doSomething(request: TechnicianDashboard.Something.Request)
}

protocol TechnicianDashboardDataStore
{
  //var name: String { get set }
}

class TechnicianDashboardInteractor: TechnicianDashboardBusinessLogic, TechnicianDashboardDataStore
{
  var presenter: TechnicianDashboardPresentationLogic?
  var worker: TechnicianDashboardWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: TechnicianDashboard.Something.Request)
  {
    worker = TechnicianDashboardWorker()
    worker?.doSomeWork()
    
    let response = TechnicianDashboard.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
