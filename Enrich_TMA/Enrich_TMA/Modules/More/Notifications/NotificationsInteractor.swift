//
//  NotificationsInteractor.swift
//  Enrich_TMA
//
//  Created by Harshal Patil on 09/10/19.
//  Copyright (c) 2019 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol NotificationsBusinessLogic {
    func getNotifications(employeeId: String)
}

class NotificationsInteractor: NotificationsBusinessLogic {

    var presenter: NotificationsPresentationLogic?
    var worker: NotificationsWorker?

    // MARK: Do something

    func getNotifications(employeeId: String) {
        worker = NotificationsWorker()
        worker?.presenter = self.presenter
        worker?.getNotificationList(employeeId: employeeId)
    }
}
