//
//  BillOfMaterialInteractor.swift
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

protocol BillOfMaterialBusinessLogic {
    func doGetAppointmentList(productCode: String)
}

class BillOfMaterialInteractor: BillOfMaterialBusinessLogic {
    var presenter: BillOfMaterialPresentationLogic?
    var worker: BillOfMaterialWorker?
    //var name: String = ""

    // MARK: Do something

    func doGetAppointmentList(productCode: String) {
        worker = BillOfMaterialWorker()
        worker?.presenter = self.presenter
        worker?.getBOMRelatedProducts(productCode: productCode)
    }
}
