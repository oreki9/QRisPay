// 
//  DetailView.swift
//  TestProject
//
//  Created by rickyTA on 03/02/24.
//

import UIKit

class DetailView: UIViewController {
    
    @IBOutlet weak var toolbar: ToolbarView!
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var detailLbl: UILabel!
    //MARK: - Property DetailView
    
    
    var presenter: VTPDetailProtocol?
    var image : UIImage?
    var detailData: PromoEntity?
    //MARK: - Lifecycle DetailView
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
        setupAction()
    }
}
extension DetailView {
    //MARK: - Function DetailView
    func setupView(){
        toolbar.setToolbar(title: "Detail")
        toolbar.delegate = self
        imageDetail.image = image
        nameLbl.text = detailData?.name ?? ""
        detailLbl.text = detailData?.detail ?? ""
    }
    func setupData(){
        
    }
    func setupAction(){
        
    }

    //MARK: - Function Action DetailView   
}
extension DetailView : ToolbarViewDelegate {
    func pressBack(){
        if let nav = self.navigationController {
            presenter?.goToBack(nav: nav)
        }
    }
}
    //MARK: - Extension DetailView

extension DetailView: PTVDetailProtocol {

}
