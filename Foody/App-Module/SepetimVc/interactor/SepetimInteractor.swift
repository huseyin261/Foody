//
//  SepetimInteractor.swift
//  Foody
//
//  Created by Hüseyin Demirkoparan on 25.02.2023.
//

import Foundation
import Alamofire
class SepetInteractor : PresenterToInteractorSepetProtocol {
   
    
    
    
   
    var SepetPresenter: InteractorToPresenterSepetProtocol?
    
    func TumSepettekiYemekleriAl() {
        let params:Parameters = ["kullanici_adi":"huseyinDemirkoparan"]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php",method: .post,parameters: params).responseJSON{ response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(SepetYemeklerCevap.self, from: data)
                    var liste = [Sepet_Yemekler]()
                    if let gelenListe = cevap.sepet_yemekler{
                        liste = gelenListe
                    }
                        self.SepetPresenter?.presenteraVeriGonder(yemekListe: liste)
                }catch{
                    // verinin bos olmasi durumu
                    self.SepetPresenter?.presenteraVeriGonder(yemekListe: [])
                    print(error.localizedDescription)
                }
            }
        }
    }
    func YemekSil(sepet_yemek_id: Int,kullanici_adi:String) {
        let params:Parameters = ["sepet_yemek_id":sepet_yemek_id,"kullanici_adi":"huseyinDemirkoparan"]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method: .post,parameters: params).responseJSON{ response in
            if let data = response.data{
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                        print(json)
                        self.TumSepettekiYemekleriAl()
                        
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    func TumSepetiSil(kullanici_adi:String) {
        var yemekListe = [Sepet_Yemekler]()
        let params:Parameters = ["kullanici_adi":"huseyinDemirkoparan"]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method: .post,parameters: params).responseJSON{ response in
            if let data = response.data{
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                        print(json)
                        yemekListe.removeAll()
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }

    }
    
   
    
    
    
    
    
   
}
