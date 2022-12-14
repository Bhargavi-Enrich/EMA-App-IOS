//
//  DependentListWorker.swift
//  Enrich_TMA
//
//  Created by Harshal on 24/11/20.
//  Copyright (c) 2020 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class DependentListWorker
{
  
    let networkLayer = NetworkLayerAlamofire()
    var presenter: DependentListPresentationLogic?
    
    func postRequestGetDependentList(request: DependentList.GetDependentList.Request) {
        // *********** NETWORK CONNECTION
        
        let errorHandler: (String) -> Void = { (error) in
            self.presenter?.presentError(responseError: error)
        }
        let successHandler: (DependentList.GetDependentList.Response) -> Void = { (response) in
            self.presenter?.presentSuccess(response: response)
        }
        
        self.networkLayer.post(urlString: ConstantAPINames.getDependantList.rawValue,
                               body: request, successHandler: successHandler,
                               errorHandler: errorHandler, method: .post)
    }
    
    func postRequestDeleteDependent(request: DependentList.DeleteDependent.Request) {
        // *********** NETWORK CONNECTION
        
        let errorHandler: (String) -> Void = { (error) in
            self.presenter?.presentError(responseError: error)
        }
        let successHandler: (DependentList.DeleteDependent.Response) -> Void = { (response) in
            self.presenter?.presentSuccess(response: response)
        }
        
        self.networkLayer.post(urlString: ConstantAPINames.deleteDependant.rawValue,
                               body: request, successHandler: successHandler,
                               errorHandler: errorHandler, method: .post)
    }
}
