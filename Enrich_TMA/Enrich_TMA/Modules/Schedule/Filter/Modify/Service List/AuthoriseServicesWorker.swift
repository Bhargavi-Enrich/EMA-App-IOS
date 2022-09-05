//
//  AuthoriseServicesWorker.swift
//  Enrich_TMA
//
//  Created by Harshal Patil on 07/01/20.
//  Copyright (c) 2020 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class AuthoriseServicesWorker {
    let networkLayer = NetworkLayerAlamofire() // Uncomment this in case do request using Alamofire for client request
    var presenter: AuthoriseServicesPresentationLogic?
    
    func postRequestForServiceList(request: MyProfile.GetServiceList.Request) {
        
        let errorHandler: (String) -> Void = { (error) in
            print(error)
            self.presenter?.presentError(responseError: error)
        }
        let successHandler: (MyProfile.GetServiceList.Response) -> Void = { (response) in
            print(response)
            self.presenter?.presentSuccess(response: response)
        }
        
        let url = ConstantAPINames.getServiceList.rawValue
        
        self.networkLayer.post(urlString: url, body: request,
                               headers: ["Content-Type": "application/json",
                                         "X-Request-From": "tma",
                                         "Authorization": "Bearer \(GenericClass.sharedInstance.isuserLoggedIn().accessToken)"],
                               successHandler: successHandler,
                               errorHandler: errorHandler,
                               method: .post)
    }
    
    func postRequestForReplaceService(request: ModifyAppointment.ReplaceService.Request, method: HTTPMethod) {
        
        let errorHandler: (String) -> Void = { (error) in
            print(error)
            self.presenter?.presentError(responseError: error)
        }
        let successHandler: (ModifyAppointment.ReplaceService.Response) -> Void = { (response) in
            print(response)
            self.presenter?.presentSuccess(response: response)
        }
        
        self.networkLayer.post(urlString: ConstantAPINames.replaceService.rawValue, body: request,
                               headers: ["Content-Type": "application/json",
                                         "X-Request-From": "tma",
                                         "Authorization": "Bearer \(GenericClass.sharedInstance.isuserLoggedIn().accessToken)"],
                               successHandler: successHandler,
                               errorHandler: errorHandler,
                               method: .post)
        
    }
    
    func postRequestForAddSingleService(request: ModifyAppointment.AddSingleService.Request, method: HTTPMethod) {
        
        let errorHandler: (String) -> Void = { (error) in
            print(error)
            self.presenter?.presentError(responseError: error)
        }
        let successHandler: (ModifyAppointment.AddSingleService.Response) -> Void = { (response) in
            print(response)
            self.presenter?.presentSuccess(response: response)
        }
        
        self.networkLayer.post(urlString: ConstantAPINames.addSingleService.rawValue, body: request,
                               headers: ["Content-Type": "application/json",
                                         "X-Request-From": "tma",
                                         "Authorization": "Bearer \(GenericClass.sharedInstance.isuserLoggedIn().accessToken)"],
                               successHandler: successHandler,
                               errorHandler: errorHandler,
                               method: .post)
    }
}
