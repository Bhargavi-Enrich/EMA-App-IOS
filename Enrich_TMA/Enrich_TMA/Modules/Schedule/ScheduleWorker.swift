//
//  ScheduleWorker.swift
//  Enrich_TMA
//
//  Created by Harshal Patil on 07/10/19.
//  Copyright (c) 2019 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class ScheduleWorker {
    let networkLayer = NetworkLayerAlamofire() // Uncomment this in case do request using Alamofire for client request
    var presenter: SchedulePresentationLogic?

    func postRequestForRosterDetails(request: MyProfile.GetRosterDetails.Request, method: HTTPMethod) {

        let errorHandler: (String) -> Void = { (error) in
            print(error)
            self.presenter?.presentError(responseError: error)
        }
        let successHandler: (MyProfile.GetRosterDetails.Response) -> Void = { (response) in
            print(response)
            self.presenter?.presentSuccess(response: response)
        }

        self.networkLayer.post(urlString: ConstantAPINames.getEmployeeList.rawValue, body: request,
                               headers: ["X-Request-From": "tma"],
                               successHandler: successHandler, errorHandler: errorHandler, method: .post)

    }

    func postRequestForAppointments(request: Schedule.GetAppointnents.Request, method: HTTPMethod) {

        let errorHandler: (String) -> Void = { (error) in
            print(error)
            self.presenter?.presentError(responseError: error)
        }
        let successHandler: (Schedule.GetAppointnents.Response) -> Void = { (response) in
            print(response)
            self.presenter?.presentSuccess(response: response)
        }

        self.networkLayer.post(urlString: ConstantAPINames.getAppointments.rawValue, body: request,
                               headers: ["X-Request-From": "tma", "Authorization": "Bearer \(GenericClass.sharedInstance.isuserLoggedIn().accessToken)"],
                               successHandler: successHandler, errorHandler: errorHandler, method: .post)

    }

    func postRequestForChangeAppointmentStatus(appointmentId: String, request: JobCard.ChangeAppointmentStatus.Request) {

        let errorHandler: (String) -> Void = { (error) in
            print(error)
            self.presenter?.presentError(responseError: error)
        }
        let successHandler: (JobCard.ChangeAppointmentStatus.Response) -> Void = { (response) in
            print(response)
            self.presenter?.presentSuccess(response: response)
        }

        let url = ConstantAPINames.changeAppointmentStatus.rawValue + appointmentId

        self.networkLayer.post(urlString: url, body: request, headers: ["X-Request-From": "tma", "Authorization": "Bearer \(GenericClass.sharedInstance.isuserLoggedIn().accessToken)"],
                               successHandler: successHandler, errorHandler: errorHandler, method: .post)
    }
}
