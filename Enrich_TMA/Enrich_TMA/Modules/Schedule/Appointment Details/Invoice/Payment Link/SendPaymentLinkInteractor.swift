//
//  SendPaymentLinkInteractor.swift
//  Enrich_TMA
//
//  Created by Harshal on 09/06/20.
//  Copyright (c) 2020 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SendPaymentLinkBusinessLogic {
    func doSendPaymentLink(request: SendPaymentLink.PaymentLink.Request)
}

protocol SendPaymentLinkDataStore {
    //var name: String { get set }
}

class SendPaymentLinkInteractor: SendPaymentLinkBusinessLogic, SendPaymentLinkDataStore {
    var presenter: SendPaymentLinkPresentationLogic?
    var worker: SendPaymentLinkWorker?
    //var name: String = ""

    // MARK: Do something

    func doSendPaymentLink(request: SendPaymentLink.PaymentLink.Request) {
        worker = SendPaymentLinkWorker()
        worker?.presenter = self.presenter
        worker?.postRequestSendPaymentLink(request: request)
    }
}
