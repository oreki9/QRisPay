// 
//  HomeView.swift
//  TestProject
//
//  Created by rickyTA on 03/02/24.
//

import UIKit

class HomeView: UIViewController {
    
    //MARK: - Property HomeView
    @IBOutlet weak var toolbar: ToolbarView!
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            self.collectionView.backgroundColor = .clear
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            self.collectionView.register(PromoList.nib(), forCellWithReuseIdentifier: PromoList.identifier)
        }
    }
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout!
    var listDictImage = Dictionary<String, UIImage>()
    var presenter: VTPHomeProtocol?
    var dataHome : HomeEntity?
    
    //MARK: - Lifecycle HomeView
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
        setupAction()
    }
}
extension HomeView {
    func setupView(){
        toolbar.setToolbar(title: "Home")
        toolbar.backBtn.isHidden = true
    }
    func setupData(){
        listDictImage["https://bit.ly/MarcommBNIFleksi-2023"] = UIImage(named:  "promo_poster")
        presenter?.getPromoData()
    }
    func setupAction(){

    }
}
extension HomeView : PromoListInputDelegate {
    func setImage(name: String, image: UIImage){
        listDictImage[name] = image
    }
}
extension HomeView: PTVHomeProtocol {
    func showListPromo(data: HomeEntity){
        dataHome = data
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: UIScreen.main.bounds.height*0.75)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataHome?.promos.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromoList.identifier, for: indexPath) as! PromoList
        let row = indexPath.row
        let itemData = dataHome?.promos[row]
        let urlName = itemData?.images_url ?? ""
        cell.setDetail(data: itemData, imageLoad: listDictImage[urlName])
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let isSelected = indexPath.row
        let itemData = dataHome?.promos[isSelected]
        if let imageLoad = listDictImage[itemData?.images_url ?? ""] {
            guard let nav = self.navigationController else {return}
            guard let dataSelected = itemData else { return }
            self.presenter?.goToDetail(image: imageLoad, data: dataSelected, nav: nav)
        }
    }
}
