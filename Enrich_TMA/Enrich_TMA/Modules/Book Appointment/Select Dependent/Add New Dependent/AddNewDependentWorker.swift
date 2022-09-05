//
//  AddNewDependentWorker.swift
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

class AddNewDependentWorker
{
    let networkLayer = NetworkLayerAlamofire()
    var presenter: AddNewDependentPresentationLogic?
    
    func postRequestAddDependent(request: DependentList.AddDependent.Request) {
        // *********** NETWORK CONNECTION
        
        let errorHandler: (String) -> Void = { (error) in
            self.presenter?.presentError(responseError: error)
        }
        let successHandler: (DependentList.AddDependent.Response) -> Void = { (response) in
            self.presenter?.presentSuccess(response: response)
        }
        
        self.networkLayer.post(urlString: ConstantAPINames.addDependant.rawValue,
                               body: request, successHandler: successHandler,
                               errorHandler: errorHandler, method: .post)
    }
}
