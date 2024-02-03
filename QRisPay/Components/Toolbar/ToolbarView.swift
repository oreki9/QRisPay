//
//  Toolbar.swift
//  QRisPay
//
//  Created by rickyTA on 02/02/24.
//

import Foundation
import UIKit
protocol ToolbarViewDelegate {
    func pressBack()
}
@IBDesignable
class ToolbarView: UIView{
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    var delegate: ToolbarViewDelegate?

    //MARK: - lifecycle ToolbarView
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    //MARK: - function ToolbarView
    func loadViewFromNib(nibName: String) -> UIView? {
        // let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: Bundle.main)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    private func setUpView(){
        guard let view = loadViewFromNib(nibName: "ToolbarView") else{ return }
        view.frame = self.bounds
        self.addSubview(view)
        self.backBtn.addTarget(self, action: #selector(btnBackTap), for: .touchUpInside)
    }
    //MARK: - Action ToolbarView
    @objc private func btnBackTap(){
        self.delegate?.pressBack()
    }
    func setToolbar(title: String, isBack: Bool? = true){
        titleLbl.text = title
        if let isBack = isBack {
            self.backBtn.isHidden = !isBack
        }
    }
}
