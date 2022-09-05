//
//  RateTheCustomerWorker.swift
//  Enrich_TMA
//
//  Created by Harshal Patil on 16/10/19.
//  Copyright (c) 2019 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class RateTheCustomerWorker {
    let networkLayer = NetworkLayerAlamofire() // Uncomment this in case do request using Alamofire for client request
    var presenter: RateTheCustomerPresentationLogic?

    func postRequestForAddRating(request: AddNewNote.ObserveNote.Request, method: HTTPMethod) {

        let errorHandler: (String) -> Void = { (error) in
            print(error)
            self.presenter?.presentError(responseError: error)
        }
        let successHandler: (AddNewNote.ObserveNote.Response) -> Void = { (response) in
            print(response)
            self.presenter?.presentAddRatingSuccess(response: response)
        }

        self.networkLayer.post(urlString: ConstantAPINames.addClientNote.rawValue,
                               body: request, headers: [:], successHandler: successHandler, errorHandler: errorHandler,
                               method: .post)

    }
}