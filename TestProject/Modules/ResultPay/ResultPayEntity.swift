// 
//  ResultPayEntity.swift
//  TestProject
//
//  Created by rickyTA on 02/02/24.
//

import Foundation

struct ResultPayEntity : Codable {
    var amountPaid : Double = 0
    var nameReceiver : String = ""
    var idTrans : String = ""
    var bankReceiver : String = ""

    init(){}
    init(
        _ amountPaid: Double,
        _ nameReceiver: String,
        _ idTrans: String,
        _ bankReceiver: String
    ){
        self.amountPaid = amountPaid
        self.nameReceiver = nameReceiver
        self.idTrans = idTrans
        self.bankReceiver = bankReceiver
    }
}
extension Array where Element == ResultPayEntity {
    func safeGet(index: Int) -> ResultPayEntity {
        if(index<0 || index>=self.count){ return ResultPayEntity() }
        return self[index]
    }
}