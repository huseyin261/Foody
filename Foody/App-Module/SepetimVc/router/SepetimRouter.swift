//
//  SepetimRouter.swift
//  Foody
//
//  Created by Hüseyin Demirkoparan on 25.02.2023.
//

import Foundation
class SepetRouter : PresenterToRouterSepetProtocol {
   
    
    static func createModule(ref: SiparislerimVC) {
        let presenter : ViewToPresenterSepetProtocol & InteractorToPresenterSepetProtocol = SepetPresenter()
        //View controller için
        ref.SepetPresenterNesnesi = presenter
        //Presenter için
        ref.SepetPresenterNesnesi?.SepetInteractor = SepetInteractor()
        ref.SepetPresenterNesnesi?.SepetView = ref 
        //Interactor için
        ref.SepetPresenterNesnesi?.SepetInteractor?.SepetPresenter = presenter
    }
}
