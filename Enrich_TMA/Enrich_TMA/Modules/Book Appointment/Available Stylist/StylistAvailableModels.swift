//
//  StylistAvailableModels.swift
//  Enrich_TMA
//
//  Created by Harshal on 17/11/20.
//  Copyright (c) 2020 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum StylistAvailable
{
    // MARK: Use cases
    
    enum GetAvailableList {
        
        struct Request: Codable {
            let appointment_id: Int64?
            let date: String?
            let end_time: String?
            let salon_code: String?
            let service_at: String?
            let service_code: String?
            let service_price: Double?
            let start_time: String?
        }
        
        struct RequestViewAll: Codable {
            let salon_code: String?
            let employee_id: Int64?
            let start_time: String?
            let end_time: String?
            let service_code: String?
            let service_at: String?
            let appointment_id: Int64?
            
        }
        
        struct Response: Codable {
            let status: Bool?
            let data: [ResponseData]?
            let message: String?
        }
        
        struct ResponseData: Codable {
            let designation_id: Int64?
            let name: String?
            let rate: Double?
            let employees: [ResponseDataTechnician]?
        }
        
        struct ResponseDataTechnician: Codable {
            let employee_id: Int64?
            let technician: String?
            let designation_id: Int64?
            let designation_name: String?
            let rating: Double?
            let employee_health_status : String?
            let employee_last_screening : String?
            let available: String?
            let slots: SlotsModel?
            let gender: String?
        }
        
        struct SlotsModel: Codable {
            let night: [StartEndTimeModel]?
            let morning: [StartEndTimeModel]?
            let afternoon: [StartEndTimeModel]?
            let evening: [StartEndTimeModel]?
        }
        
        struct StartEndTimeModel: Codable {
            let start_time: String?
            let end_time: String?
        }
    }
}
