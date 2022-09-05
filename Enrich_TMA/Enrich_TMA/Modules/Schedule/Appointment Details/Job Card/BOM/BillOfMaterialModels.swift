//
//  BillOfMaterialModels.swift
//  Enrich_TMA
//
//  Created by Harshal Patil on 05/12/19.
//  Copyright (c) 2019 e-zest. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum BillOfMaterial {
  // MARK: Use cases

    enum RelatedBOMProducts {
        struct Response: Codable {
            let id: Int64?
            let sku: String?
            let name: String?
            let attribute_set_id: Int64?
            let price: Int?
            let status: Int?
            let visibility: Int?
            let type_id: String?
            let created_at: String?
            let updated_at: String?
            let weight: Int?
            let product_links: [Product_links]?
            let custom_attributes: [Custom_attributes]?
        }

        struct Custom_attributes: Codable {
            let attribute_code: String?
            let value: AnyCodable?
        }

        struct Product_links: Codable {
            let sku: String?
            let link_type: String?
            let position: Int?
            let type_id: String?
            let id: Int64?
            let name: String?
            let price: Int?
            let attribute_set_id: Int64?
            let status: Int64?
            let visibility: Int?
            let stock_status: Int?
            let created_at: String?
            let updated_at: String?
        }
    }

}
