//
//  AnasayfaPresenter.swift
//  Foody
//
//  Created by Hüseyin Demirkoparan on 24.02.2023.
//

import Foundation

class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func YemekleriYukle() {
        anasayfaInteractor?.tumYemekleriAl()
    }
  
    
   
}

extension AnasayfaPresenter : InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(YemeklerListe: Array<Yemekler>) {
        anasayfaView?.vieweVeriGonder(YemeklerListe: YemeklerListe)
    }
}
