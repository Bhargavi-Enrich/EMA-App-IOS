//
//  ScheduleInteractor.swift
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

protocol ScheduleBusinessLogic {
    func doGetRosterData(request: MyProfile.GetRosterDetails.Request, method: HTTPMethod)
    func doGetAppointmentList(request: Schedule.GetAppointnents.Request, method: HTTPMethod)
    func doPostUpdateAppointmentStatus(appointmentId: String, request: JobCard.ChangeAppointmentStatus.Request)
}

class ScheduleInteractor: ScheduleBusinessLogic {
    var presenter: SchedulePresentationLogic?
    var worker: ScheduleWorker?
    //var name: String = ""

    // MARK: Do something

    func doGetRosterData(request: MyProfile.GetRosterDetails.Request, method: HTTPMethod) {
        worker = ScheduleWorker()
        worker?.presenter = self.presenter
        worker?.postRequestForRosterDetails(request: request, method: method)
    }

    func doGetAppointmentList(request: Schedule.GetAppointnents.Request, method: HTTPMethod) {
        worker = ScheduleWorker()
        worker?.presenter = self.presenter
        worker?.postRequestForAppointments(request: request, method: method)
    }

    func doPostUpdateAppointmentStatus(appointmentId: String, request: JobCard.ChangeAppointmentStatus.Request) {
        worker = ScheduleWorker()
        worker?.presenter = self.presenter
        worker?.postRequestForChangeAppointmentStatus(appointmentId: appointmentId, request: request)
    }

}
