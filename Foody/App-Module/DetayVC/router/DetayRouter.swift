//
//  DetayRouter.swift
//  Foody
//
//  Created by Hüseyin Demirkoparan on 24.02.2023.
//

import Foundation

class DetayRouter : PresenterToRouterDetayProtocol {
    static func createModule(ref: DetayVC) {
        ref.DetayPresenterNesnesi = DetayPresenter()
        ref.DetayPresenterNesnesi?.DetayInteractor = DetayInteractor()
    }
}
