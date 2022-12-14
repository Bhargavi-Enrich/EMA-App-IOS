//
//  JobCardWorker.swift
//  Enrich_TMA
//
//  Created by Harshal Patil on 11/11/19.
//  Copyright (c) 2019 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class JobCardWorker {

    let networkLayer = NetworkLayerAlamofire() // Uncomment this in case do request using Alamofire for client request
    var presenter: JobCardPresentationLogic?

    func postRequestForAppointments(request: Schedule.GetAppointnents.SingleAppointmentRequest, method: HTTPMethod) {

        let errorHandler: (String) -> Void = { (error) in
            print(error)
            self.presenter?.presentError(responseError: error)
        }
        let successHandler: (Schedule.GetAppointnents.Response) -> Void = { (response) in
            print(response)
            self.presenter?.presentGetAppointmentsSuccess(response: response)
        }

        self.networkLayer.post(urlString: ConstantAPINames.getAppointments.rawValue, body: request,
                               headers: ["X-Request-From": "tma",
                                         "Authorization": "Bearer \(GenericClass.sharedInstance.isuserLoggedIn().accessToken)"],
                               successHandler: successHandler, errorHandler: errorHandler, method: .post)

    }

    func postRequestForBOM(accessToken: String, method: HTTPMethod, request: JobCard.BillOfMaterial.Request) {

        let errorHandler: (String) -> Void = { (error) in
            print(error)
            self.presenter?.presentError(responseError: error)
        }
        let successHandler: (JobCard.BillOfMaterial.Response) -> Void = { (response) in
            print(response)
            self.presenter?.presentGetBOMSuccess(response: response)
        }

        self.networkLayer.post(urlString: ConstantAPINames.getBOM.rawValue, body: request,
                               headers: ["X-Request-From": "tma",
                                         "Authorization": "bearer \(accessToken)"],
                               successHandler: successHandler, errorHandler: errorHandler, method: .post)

    }

    func postRequestForUpdateBOM(method: HTTPMethod, request: JobCard.UpdateBillOfMaterial.Request) {

        let errorHandler: (String) -> Void = { (error) in
            print(error)
            self.presenter?.presentError(responseError: error)
        }
        let successHandler: (JobCard.UpdateBillOfMaterial.Response) -> Void = { (response) in
            print(response)
            self.presenter?.presentUpdateBOMSuccess(response: response)
        }

        self.networkLayer.post(urlString: ConstantAPINames.updateBOM.rawValue, body: request,
                               headers: ["X-Request-From": "tma",
                                         "Authorization": "bearer \(GenericClass.sharedInstance.isuserLoggedIn().accessToken)"],
                               successHandler: successHandler, errorHandler: errorHandler, method: .post)

    }

    func postRequestForChangeServiceStatus(serviceId: String, request: JobCard.ChangeServiceStatus.Request) {

        let errorHandler: (String) -> Void = { (error) in
            print(error)
            self.presenter?.presentError(responseError: error)
        }
        let successHandler: (JobCard.ChangeServiceStatus.Response) -> Void = { (response) in
            print(response)
            self.presenter?.presentStartServiceSuccess(response: response)
        }

        let url = ConstantAPINames.changeServiceStatus.rawValue + serviceId

        self.networkLayer.post(urlString: url, body: request,
                               headers: ["X-Request-From": "tma",
                                         "Authorization": "Bearer \(GenericClass.sharedInstance.isuserLoggedIn().accessToken)"],
                               successHandler: successHandler, errorHandler: errorHandler, method: .post)

    }

    func getRequestForServiceDescription(serviceCode: String) {

        let errorHandler: (String) -> Void = { (error) in
            print(error)
            self.presenter?.presentError(responseError: error)
        }
        let successHandler: (BillOfMaterial.RelatedBOMProducts.Response) -> Void = { (response) in
            print(response)
            self.presenter?.presentServiceDescription(response: response)
        }

        let url = ConstantAPINames.getRelatedBOMProducts.rawValue + serviceCode

        self.networkLayer.get(urlString: url, headers: [:], successHandler: successHandler, errorHandler: errorHandler)
    }

    func getRequestForAppointmentStatus(appointmentId: String) {

        let errorHandler: (String) -> Void = { (error) in
            self.presenter?.presentError(responseError: error)
        }

        let successHandler: (AppointmentDetails.AppointmentStatus.Response) -> Void = { (response) in
            self.presenter?.presentGetAppointmentStatus(response: response)
        }

        let url = ConstantAPINames.checkAppointmentStatus.rawValue + appointmentId

        self.networkLayer.get(urlString: url,
                              headers: ["X-Request-From": "tma"],
                              successHandler: successHandler,
                              errorHandler: errorHandler)
    }
}
