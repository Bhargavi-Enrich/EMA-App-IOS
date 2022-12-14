//
//  EarningsRouter.swift
//  Enrich_TMA
//
//  Created by Harshal on 13/12/21.
//  Copyright (c) 2021 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol EarningsRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol EarningsDataPassing
{
  var dataStore: EarningsDataStore? { get }
}

class EarningsRouter: NSObject, EarningsRoutingLogic, EarningsDataPassing
{
  weak var viewController: EarningsViewController?
  var dataStore: EarningsDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: EarningsViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: EarningsDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
