//
//  ViewCTCModels.swift
//  Enrich_TMA
//
//  Created by Harshal on 21/12/21.
//  Copyright (c) 2021 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum ViewCTC
{
  // MARK: Use cases
  
  enum Something
  {
    struct Request
    {
    }
    struct Response
    {
    }
    struct ViewModel
    {
    }
  }
    
    //Earnings
    enum GetCTCDeatils {
        struct Request: Codable {
        }
        
        struct Response : Codable {
            let status : Bool?
            let message : String?
            let data : Data?
        }
        
        struct Data : Codable {
            let entity_id : Int?
            let employee_code : String?
            let basic : Int?
            let special_allowance : Int?
            let home_rent_allowance : Int?
            let bonus : Int?
            let washing_allowance : Int?
            let food_allowance : Int?
            let conveyance_allowance : Int?
            let education_allowance : Int?
            let medical_allowance : Int?
            let telephone_allowance : Int?
            let other_allowance : Int?
            let employee_pf : Int?
            let employee_esic : Int?
            let professional_tax : Int?
            let mediclaim : Int?
            let company_pf : Int?
            let admin_pf : Int?
            let company_esic : Int?
            let additional_special_allowance : Int?
            let additional_payout : Int?
            let assured_payout : Int?
            let books_and_periodicals_allowance : Int?
            let car_maintenance : Int?
            let client_repeat_inc : Int?
            let communication_allowance : Int?
            let dearness_allowance : Int?
            let driver_allowance : Int?
            let driver_salary : Int?
            let ex_gratia : Int?
            let free_service_commission : Int?
            let fuel_allowance_above : Int?
            let fuel_allowance_below : Int?
            let fuel_allowance_two_wheeler : Int?
            let leave_travel_allowance : Int?
            let membership_redemption_incentive : Int?
            let new_salon_commission : Int?
            let skill_bonus : Int?
            let special_salon_commission : Int?
            let tea_allowance : Int?
            let tenure_commission : Int?
            let travel_allowance : Int?
            let training_allowance : Int?
            let uhs_allowance : Int?
            let fix_pay : Int?
            let ctc : Int?
            let gratuity : Int?
            let take_home : Int?
            let hra_da : Int?
            let statutory_bonus : Int?
            let grooming_points : Int?
            let mediclaim_coverage : Int?
            let life_insurance_coverage : Int?
        }
    }
}
