//
//  SepetimProtocol.swift
//  Foody
//
//  Created by Hüseyin Demirkoparan on 25.02.2023.
//

import Foundation

protocol ViewToPresenterSepetProtocol {
    var SepetInteractor:PresenterToInteractorSepetProtocol? {get set}
    var SepetView:PresenterToViewSepetProtocol? {get set}
    
    func YemekleriYukle()
    func sil(sepet_yemek_id:Int,kullanici_adi:String)
    func Sepetisil(kullanici_adi:String)

}

protocol PresenterToInteractorSepetProtocol {
    var SepetPresenter:InteractorToPresenterSepetProtocol? {get set}
    
    func TumSepettekiYemekleriAl()
    func YemekSil(sepet_yemek_id:Int,kullanici_adi:String)
    func TumSepetiSil(kullanici_adi:String)

}

protocol InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(yemekListe:Array<Sepet_Yemekler>)
}

protocol PresenterToViewSepetProtocol {
    func vieweVeriGonder(yemekListe:Array<Sepet_Yemekler>)
}

protocol PresenterToRouterSepetProtocol {
    static func createModule(ref:SiparislerimVC)
}
