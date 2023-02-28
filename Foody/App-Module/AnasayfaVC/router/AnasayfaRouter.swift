//
//  AnasayfaRouter.swift
//  Foody
//
//  Created by Hüseyin Demirkoparan on 24.02.2023.
//

import Foundation

class AnasayfaRouter : PresenterToRouterAnasayfaProtocol {
    static func createModule(ref: AnasayfaVC) {
        let presenter : ViewToPresenterAnasayfaProtocol & InteractorToPresenterAnasayfaProtocol = AnasayfaPresenter()
        //View controller için
        ref.anasayfaPresenterNesnesi = presenter
        //Presenter için
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor = AnasayfaInteractor()
        ref.anasayfaPresenterNesnesi?.anasayfaView = ref 
        //Interactor için
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor?.anasayfaPresenter = presenter
    }
}
