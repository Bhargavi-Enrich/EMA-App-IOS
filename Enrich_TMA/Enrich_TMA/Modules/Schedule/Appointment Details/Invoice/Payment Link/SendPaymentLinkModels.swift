//
//  SendPaymentLinkModels.swift
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

enum SendPaymentLink {
    // MARK: Use cases

    enum PaymentLink {

        struct Request: Codable {
            let appointment_id: Int64?
            let mobile: String?
            let quote_id: String?
            let salon_code: String?
            let is_custom: Bool?
            let pos_request: Bool?
        }

        struct Response: Codable {
            var status: Bool = false
            let message: String?
        }
    }
}
