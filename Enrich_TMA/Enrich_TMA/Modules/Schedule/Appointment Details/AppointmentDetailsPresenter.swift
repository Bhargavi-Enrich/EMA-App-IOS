//
//  AppointmentDetailsPresenter.swift
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

protocol AppointmentDetailsPresentationLogic {
    func presentGetAppointmentsSuccess<T: Decodable>(response: T)
    func presentUpdateAppointmentStatus<T: Decodable>(response: T)
    func presentGetAppointmentStatus<T: Decodable>(response: T)
    func presentError(responseError: String?)
}

class AppointmentDetailsPresenter: AppointmentDetailsPresentationLogic {
    weak var viewController: AppointmentDetailsDisplayLogic?

    // MARK: Do something

    func presentGetAppointmentsSuccess<T>(response: T) where T: Decodable {
        viewController?.displaySuccess(viewModel: response)
    }

    func presentError(responseError: String?) {
        viewController?.displayError(errorMessage: responseError)
    }

    func presentUpdateAppointmentStatus<T: Decodable>(response: T) {
        viewController?.displaySuccess(viewModel: response)
    }

    func presentGetAppointmentStatus<T: Decodable>(response: T) {
        viewController?.displaySuccess(viewModel: response)
    }

}
