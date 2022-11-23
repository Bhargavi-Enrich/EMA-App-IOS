//
//  DashboardWorker.swift
//  Enrich_TMA
//
//  Created by Harshal Patil on 15/10/19.
//  Copyright (c) 2019 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class DashboardWorker {
    let networkLayer = NetworkLayerAlamofire() // Uncomment this in case do request using Alamofire for client request
    var presenter: DashboardPresentationLogic?

    func getRequestForUserProfile(accessToken: String, method: HTTPMethod) {

        let errorHandler: (String) -> Void = { (error) in
            print(error)
            self.presenter?.presentError(responseError: error)
        }
        let successHandler: (MyProfile.GetUserProfile.Response) -> Void = { (response) in
            print(response)
            self.presenter?.presentSuccess(response: response)
        }

        self.networkLayer.get(urlString: ConstantAPINames.getUserProfile.rawValue, headers: ["Authorization": "Bearer \(accessToken)"], successHandler: successHandler, errorHandler: errorHandler)

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

    func postGetDashboardData(request: Dashboard.GetDashboardData.Request, method: HTTPMethod) {
        // *********** NETWORK CONNECTION

        let errorHandler: (String) -> Void = { (error) in
            print(error)
            self.presenter?.presentError(responseError: error)
        }
        let successHandler: (Dashboard.GetDashboardData.Response) -> Void = { (response) in
            self.presenter?.presentSuccess(response: response)
        }

        self.networkLayer.post(urlString: ConstantAPINames.getDashboardData.rawValue, body: request, headers: ["Content-Type": "application/json"], successHandler: successHandler, errorHandler: errorHandler, method: method)
    }

    func getForceUpdateInfo() {

        let errorHandler: (String) -> Void = { (error) in
            print(error)
            self.presenter?.presentError(responseError: error)
        }
        let successHandler: (Dashboard.GetForceUpadateInfo.Response) -> Void = { (response) in
            self.presenter?.presentSuccess(response: response)
        }

        self.networkLayer.get(urlString: ConstantAPINames.getForceUpdateInfo.rawValue,
                              headers: [:],
                              successHandler: successHandler,
                              errorHandler: errorHandler)

    }

    func deleteRequestForAppointment(request: ModifyAppointment.DeleteAppointment.Request, appointmentId: String) {

        let errorHandler: (String) -> Void = { (error) in
            print(error)
            self.presenter?.presentError(responseError: error)
        }
        let successHandler: (ModifyAppointment.DeleteAppointment.Response) -> Void = { response in
            self.presenter?.presentSuccess(response: response)
        }
        let strUrl = ConstantAPINames.deleteAppointment.rawValue + appointmentId
        self.networkLayer.post(urlString: strUrl, body: request,
                               headers: ["Content-Type": "application/json",
                                         "X-Request-From": "tma",
                                         "Authorization": "Bearer \(GenericClass.sharedInstance.isuserLoggedIn().accessToken)"],
                               successHandler: successHandler,
                               errorHandler: errorHandler, method: .post)
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
    
    func postRequestGetIncentiveDashboard(request: Dashboard.GetIncentiveDashboard.Request) {

        let errorHandler: (String) -> Void = { (error) in
            print(error)
            self.presenter?.presentError(responseError: error)
        }
        let successHandler: (Dashboard.GetIncentiveDashboard.Response) -> Void = { (response) in
            print(response)
            self.presenter?.presentSuccess(response: response)
        }

        let url = ConstantAPINames.getIncentiveDashboard.rawValue

        self.networkLayer.post(urlString: url, body: request, headers: ["X-Request-From": "tma", "Authorization": "Bearer \(GenericClass.sharedInstance.isuserLoggedIn().accessToken)"],
                               successHandler: successHandler, errorHandler: errorHandler, method: .post)
    }
    
    func postRequestGetRevenueDashboard(request: Dashboard.GetRevenueDashboard.Request) {

        let errorHandler: (String) -> Void = { (error) in
            print(error)
            self.presenter?.presentError(responseError: error)
        }
        let successHandler: (Dashboard.GetRevenueDashboard.Response) -> Void = { (response) in
           // print(response)
            self.presenter?.presentSuccess(response: response)
        }

        let url = ConstantAPINames.getRevenueDashboard.rawValue

        self.networkLayer.get(urlString: url, headers: ["X-Request-From": "tma", "Authorization": "Bearer \(GenericClass.sharedInstance.isuserLoggedIn().accessToken)"], successHandler: successHandler, errorHandler: errorHandler)
    }
    
    //Get earnings data
    func postRequestGetEarningsDashboard(request: Dashboard.GetEarningsDashboard.Request) {

        let errorHandler: (String) -> Void = { (error) in
            print(error)
            self.presenter?.presentError(responseError: error)
        }
        let successHandler: (Dashboard.GetEarningsDashboard.Response) -> Void = { (response) in
            //print("Earnings response\(response)")
            self.presenter?.presentSuccess(response: response)
        }

        let url = ConstantAPINames.getEarningsDashboard.rawValue

        self.networkLayer.get(urlString: url, headers: ["X-Request-From": "tma", "Authorization": "Bearer \(GenericClass.sharedInstance.isuserLoggedIn().accessToken)"], successHandler: successHandler, errorHandler: errorHandler)
    }
}
