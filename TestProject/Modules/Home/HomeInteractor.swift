// 
//  HomeInteractor.swift
//  TestProject
//
//  Created by rickyTA on 03/02/24.
//

import Foundation
import UIKit

class HomeInteractor: PTIHomeProtocol {
    
    //MARK: - Property HomeInteractor
    var presenter: ITPHomeProtocol?
    
    //MARK: - Lifecycle HomeInteractor
    
    
    //MARK: - Function HomeInteractor
    func fetchPromoData(){
        APIRequest.shared.makeRequest(urlString: "http://demo5853970.mockable.io/promos") { (result: Result<HomeEntity, APIError>) in
            switch result {
            case .success(let post):
                self.presenter?.setListPromo(data: post)
            case .failure(let error):
                print("Error:", error)
            }
        }
    }
}

    //MARK: - Extension HomeInteractor
