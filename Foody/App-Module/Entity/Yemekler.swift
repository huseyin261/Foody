//
//  Yemekler.swift
//  Foody
//
//  Created by Hüseyin Demirkoparan on 24.02.2023.
//

import Foundation
class Yemekler :Codable{

    var  yemek_id:String?
    var  yemek_adi:String?
    var  yemek_resim_adi:String?
    var  yemek_fiyat:String?
    var kullanici_adi:String?

    init (){}

    init(yemek_id:String,yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:String,kullanici_adi:String?) {
        self.yemek_id = yemek_id
        self.yemek_adi = yemek_adi
        self.yemek_resim_adi = yemek_resim_adi
        self.yemek_fiyat = yemek_fiyat
        self.kullanici_adi = kullanici_adi
    }
}
