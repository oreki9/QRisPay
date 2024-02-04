// 
//  HomeEntity.swift
//  TestProject
//
//  Created by rickyTA on 03/02/24.
//

import Foundation

struct HomeEntity : Decodable{
    var promos : [PromoEntity]
}
struct PromoEntity: Decodable {
    var id: Int = 0
    var name: String = ""
    var images_url: String = ""
    var detail: String = ""
}
