//
//  TeleConsultationModels.swift
//  Enrich_TMA
//
//  Created by Harshal on 12/05/20.
//  Copyright (c) 2020 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum TeleConsultation {
    // MARK: Use cases

    enum GetConsultationRecords {

        struct PendingRecordRequest: Codable {
            let date: String?
            let employee_id: String?
            let salon_id: String?
            let is_custom: Bool?
        }

        struct CompletedRecordRequest: Codable {
            let employee_id: String?
            let page_size: Int?
            let page_number: Int?
            let is_custom: Bool?
        }

        struct PendingResponse: Codable {
            var status: Bool = false
            var message: String = ""
            let data: [Data]?
        }

        struct CompletedResponse: Codable {
            var status: Bool = false
            var message: String = ""
            let total_records: Int?
            let data: [Data]?
        }

        struct Data: Codable {
            let entity_id: String?
            let customer_id: String?
            let salon_id: String?
            let employee_id: String?
            let status: String?
            let status_label: String?
            let customer_mobile_number: String?
            let customer_name: String?
            let customer_code: String?
            let employee_name: String?
            let notes: String?
            let is_pending: String?
            let created_at: String?
            let updated_at: String?
            let called_at: String?
            let history: [Data]?
        }
    }

    enum GetConsulationStatus {

        struct Response: Codable {
            var status: Bool = false
            var message: String = ""
            let data: [Data]?
        }

        struct Data: Codable {
            var status: String?
            var label: String?
        }
    }

    enum SubmitFeedback {

        struct Request: Codable {
            let call_id: String?
            let notes: String?
            let status: String?
            let is_custom: Bool?
        }

        struct Response: Codable {
            var status: Bool = false
            var message: String = ""
            let data: [Data]?
        }

        struct Data: Codable {
            var status: String?
            var label: String?
        }
    }
    
    enum OutbondCalling {

        struct Request: Codable {
            let technician_number: String?
            let customer_number: String?
            let is_custom: Bool?
        }

        struct Response: Codable {
            var status: Bool = false
            var message: String = ""
            let caller_id: String?
        }
    }

}
