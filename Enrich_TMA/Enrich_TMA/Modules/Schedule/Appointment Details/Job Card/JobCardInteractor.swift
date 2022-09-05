//
//  JobCardInteractor.swift
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

protocol JobCardBusinessLogic {
    func doGetAppointmentList(request: Schedule.GetAppointnents.SingleAppointmentRequest, method: HTTPMethod)
    func doGetServiceBOM(accessToken: String, method: HTTPMethod, request: JobCard.BillOfMaterial.Request)
    func doPostServiceBOM(method: HTTPMethod, request: JobCard.UpdateBillOfMaterial.Request)
    func doPostUpdateServiceStatus(serviceId: String, request: JobCard.ChangeServiceStatus.Request)
    func doGetServiceDescription(serviceCode: String)
    func doGetAppointmentStatus(appointmentId: String)
}

protocol JobCardDataStore {
    //var name: String { get set }
}

class JobCardInteractor: JobCardBusinessLogic, JobCardDataStore {
    var presenter: JobCardPresentationLogic?
    var worker: JobCardWorker?
    //var name: String = ""

    // MARK: Do something

    func doGetAppointmentList(request: Schedule.GetAppointnents.SingleAppointmentRequest, method: HTTPMethod) {
        worker = JobCardWorker()
        worker?.presenter = self.presenter
        worker?.postRequestForAppointments(request: request, method: method)
    }

    func doGetServiceBOM(accessToken: String, method: HTTPMethod, request: JobCard.BillOfMaterial.Request) {
        worker = JobCardWorker()
        worker?.presenter = self.presenter
        worker?.postRequestForBOM(accessToken: accessToken, method: method, request: request)
    }

    func doPostServiceBOM(method: HTTPMethod, request: JobCard.UpdateBillOfMaterial.Request) {
        worker = JobCardWorker()
        worker?.presenter = self.presenter
        worker?.postRequestForUpdateBOM(method: method, request: request)
    }

    func doPostUpdateServiceStatus(serviceId: String, request: JobCard.ChangeServiceStatus.Request) {
        worker = JobCardWorker()
        worker?.presenter = self.presenter
        worker?.postRequestForChangeServiceStatus(serviceId: serviceId, request: request)
    }

    func doGetServiceDescription(serviceCode: String) {
        worker = JobCardWorker()
        worker?.presenter = self.presenter
        worker?.getRequestForServiceDescription(serviceCode: serviceCode)
    }

    func doGetAppointmentStatus(appointmentId: String) {
        worker = JobCardWorker()
        worker?.presenter = self.presenter
        worker?.getRequestForAppointmentStatus(appointmentId: appointmentId)
    }

}
