//
//  ShiftCalendarWorker.swift
//  Enrich_TMA
//
//  Created by Harshal on 02/08/21.
//  Copyright (c) 2021 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class ShiftCalendarWorker
{
    let networkLayer = NetworkLayerAlamofire() // Uncomment this in case do request using Alamofire for client request
    var presenter: ShiftCalendarPresentationLogic?
    
    func postRequestForRosterDetails(request: MyProfile.GetRosterDetails.Request, method: HTTPMethod) {

        let errorHandler: (String) -> Void = { (error) in
            print(error)
            self.presenter?.presentError(responseError: error)
        }
        let successHandler: (MyProfile.GetRosterDetails.Response) -> Void = { (response) in
            print(response)
            self.presenter?.presentGetRosterDetailsSuccess(response: response)
        }

        self.networkLayer.post(urlString: ConstantAPINames.getEmployeeList.rawValue, body: request,
                               headers: ["X-Request-From": "tma"],
                               successHandler: successHandler, errorHandler: errorHandler, method: .post)

    }
}
