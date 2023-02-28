//
//  AnasayfaProtocol.swift
//  Foody
//
//  Created by Hüseyin Demirkoparan on 24.02.2023.
//

import Foundation
protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor:PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView:PresenterToViewAnasayfaProtocol? {get set}
    
    func YemekleriYukle()
}

protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter:InteractorToPresenterAnasayfaProtocol? {get set}
    
    func tumYemekleriAl()
}
protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(YemeklerListe:Array<Yemekler>)
}

protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(YemeklerListe:Array<Yemekler>)
}

protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref:AnasayfaVC)
}
