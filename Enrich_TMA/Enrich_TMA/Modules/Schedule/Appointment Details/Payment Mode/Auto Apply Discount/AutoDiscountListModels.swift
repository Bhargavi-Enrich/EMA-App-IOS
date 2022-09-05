//
//  AutoDiscountListModels.swift
//  Enrich_TMA
//
//  Created by Harshal on 31/07/20.
//  Copyright (c) 2020 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum AutoDiscountList
{
  // MARK: Use cases
    
    enum GetDiscountList {
        struct Response: Codable {
            let status: Bool?
            let message: String?
            let data: offers?
        }

        struct offers: Codable {
            var applied_offers: [discountList]?
            var removed_offers: [discountList]?
        }
    }
    
    enum ApplyRemoveDiscount {
        struct Request: Codable {
            let quote_id: String?
            let rule_id: String?
            let discard: String?
        }

        struct Response: Codable {
            let status: Bool?
            let message: String?
            let data: ResultData?
        }

        struct ResultData: Codable {
            let totals_html: Totals_html?
            var applied_offers: [discountList]?
            var removed_offers: [discountList]?
        }
    }
    
    struct discountList: Codable {
        var id: String?
        var name: String?
        var description: String?
    }
}
