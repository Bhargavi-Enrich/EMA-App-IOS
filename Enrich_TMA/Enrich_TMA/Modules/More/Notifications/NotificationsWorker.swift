//
//  NotificationsWorker.swift
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

class NotificationsWorker {

    let networkLayer = NetworkLayerAlamofire()
    var presenter: NotificationsPresentationLogic?

    func getNotificationList(employeeId: String) {

        let errorHandler: (String) -> Void = { (error) in
            print(error)
            self.presenter?.presentError(responseError: error)
        }
        let successHandler: (Notifications.MyNotificationList.Response) -> Void = { (response) in
            print(response)
            self.presenter?.presentSuccess(response: response)
        }

        let deviceToken: String = GenericClass.sharedInstance.getFCMTopicKeys(keyFor: FCMTopicKeys.employee) + employeeId

        var strURL: String = ConstantAPINames.getNotificationList.rawValue
        strURL = String(format: "\(strURL)&device_id=%@", deviceToken)
        self.networkLayer.get(urlString: strURL,
                              headers: ["Authorization": "Bearer \(GenericClass.sharedInstance.isuserLoggedIn().accessToken)"],
                              successHandler: successHandler,
                              errorHandler: errorHandler)
    }
}
