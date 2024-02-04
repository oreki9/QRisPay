//
//  PromoList.swift
//  TestProject
//
//  Created by rickyTA on 03/02/24.
//

import UIKit

class PromoList: UICollectionViewCell {
    @IBOutlet weak var imagePromo: UIImageView!
    @IBOutlet var titleTab: UILabel!
    
    static let identifier = "PromoList"
    var data: PromoEntity?
    var delegate: PromoListInputDelegate?
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setDetail(data: PromoEntity?, imageLoad: UIImage?){
        self.data = data
        titleTab.text = data?.name
        if(imageLoad != nil){
            imagePromo.image = imageLoad
        }else{
            loadImage(name: data?.images_url ?? "")
        }
    }
    func loadImage(name: String) {
        guard let url = URL(string: name) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error loading image: \(error)")
            } else if let data = data {
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        self.imagePromo.image = image
                        self.delegate?.setImage(name: name, image: image)
                    } else {
                        print("Failed to create image from data.")
                    }
                }
            }
        }.resume()
    }
}
protocol PromoListInputDelegate {
    func setImage(name: String, image: UIImage)
}
