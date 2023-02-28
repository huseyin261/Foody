//
//  ViewController.swift
//  Foody
//
//  Created by Hüseyin Demirkoparan on 24.02.2023.
//

import UIKit
import Alamofire
import Kingfisher
class AnasayfaVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var anasayfaCollectionView: UICollectionView!
    var YemeklerListe = [Yemekler]()
    var filteredYemeklerListe = [Yemekler]()
    
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        anasayfaCollectionView.delegate = self
        anasayfaCollectionView.dataSource = self
        searchBar.delegate = self
        let genislik = anasayfaCollectionView.frame.size.width
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 5
        tasarim.minimumLineSpacing = 5
        tasarim.itemSize = CGSize(width: (genislik-25)/2, height: (genislik-25)/2)
        anasayfaCollectionView.collectionViewLayout = tasarim

        AnasayfaRouter.createModule(ref: self)
        anasayfaPresenterNesnesi?.YemekleriYukle()
    }
    
    func renkDegistir(itemAppearance:UITabBarItemAppearance){
        itemAppearance.selected.iconColor = UIColor.systemOrange
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.systemOrange]
        itemAppearance.selected.badgeBackgroundColor = UIColor.systemOrange
    }
    
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.anasayfaInteractor?.tumYemekleriAl()
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDetay"{
            let yemek = sender as? Yemekler
            let gidilecekVC = segue.destination as! DetayVC
            gidilecekVC.yemekVeri = yemek
            
            
        }
    }
    
}

extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(YemeklerListe: Array<Yemekler>) {
        self.YemeklerListe = YemeklerListe
        self.filteredYemeklerListe = YemeklerListe
        DispatchQueue.main.async {
            self.anasayfaCollectionView.reloadData()
        }
    }
}

extension AnasayfaVC:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filteredYemeklerListe = self.YemeklerListe.filter{yemek in
            if yemek.yemek_adi!.lowercased().contains(searchText.lowercased()){
                return true
            }
            if searchText == ""{
                return true
            }
            return false
        }
        self.anasayfaCollectionView.reloadData()
    }
}
extension AnasayfaVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let yemekDetay = YemeklerListe[indexPath.row]
        performSegue(withIdentifier: "ToDetay", sender: yemekDetay)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredYemeklerListe.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let yemek = filteredYemeklerListe[indexPath.row]
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "YemekHucre", for: indexPath) as! anasayfaCollectionViewCell
        hucre.yemeklabel.text = yemek.yemek_adi
        hucre.imagesphoto.kf.setImage(with: URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)"))
        hucre.layer.borderColor = UIColor.systemGray4.cgColor
        hucre.layer.borderWidth = 1
        
        
        hucre.layer.shadowColor = UIColor.systemGray2.cgColor
        hucre.layer.shadowOffset = CGSize(width: 0, height: 1.2)
        hucre.layer.shadowRadius = 5.0
        hucre.layer.shadowOpacity = 0.7
        hucre.layer.masksToBounds = false


        return hucre
    }
}
