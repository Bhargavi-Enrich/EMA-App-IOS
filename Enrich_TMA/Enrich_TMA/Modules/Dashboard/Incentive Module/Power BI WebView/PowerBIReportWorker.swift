//
//  PowerBIReportWorker.swift
//  Enrich_SMA
//
//  Created by Harshal on 07/08/20.
//  Copyright (c) 2020 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class PowerBIReportWorker {
    let networkLayer = NetworkLayerAlamofire() // Uncomment this in case do request using Alamofire for client request
    var presenter: PowerBIReportPresentationLogic?

    func getReportDetails(reportId: String) {

        let errorHandler: (String) -> Void = { (error) in
            print(error)
            self.presenter?.presentError(responseError: error)
        }
        let successHandler: (PowerBIReport.GetReportDetails.Response) -> Void = { (response) in
            self.presenter?.presentSuccess(response: response)
        }

        let url = ConstantAPINames.getReportDetails.rawValue + "&report_id=\(reportId)"

        self.networkLayer.get(urlString: url,
                              headers: ["Authorization": "Bearer \(GenericClass.sharedInstance.isuserLoggedIn().accessToken)"],
                              successHandler: successHandler,
                              errorHandler: errorHandler)

    }
}
