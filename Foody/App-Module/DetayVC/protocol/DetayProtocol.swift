//
//  DetayProtocol.swift
//  Foody
//
//  Created by Hüseyin Demirkoparan on 24.02.2023.
//

import Foundation
protocol ViewToPresenterDetayProtocol {
    var DetayInteractor:PresenterToInteractorDetayProtocol? {get set}
    func Ekle(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:Int,yemek_siparis_adet:Int,kullanici_adi:String)
}

protocol PresenterToInteractorDetayProtocol {
    func SepeteEkle(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:Int,yemek_siparis_adet:Int,kullanici_adi:String)
}
protocol PresenterToRouterDetayProtocol {
    static func createModule(ref:DetayVC)
}
