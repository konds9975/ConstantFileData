//
//  SymptomLogbookModel.swift
//  Cipla
//
//  Created by Hitendra Bhoir on 13/07/18.
//  Copyright © 2018 Fortune4 Technologies. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
class SymptomLogbookModel: Object
{
    //Symtomps faced today
    
    @objc dynamic var isWheezing : String!
    @objc dynamic var isCough : String!
    @objc dynamic var isChestTightness : String!
    @objc dynamic var isDifficultyBreathing : String!
    
    @objc dynamic var addDateAndTime : String!
    @objc dynamic var addDate : String!
    
    @objc dynamic var possibleTrigger : String!
    
    @objc dynamic var location: String!
    @objc dynamic var locationLatitude: String!
    @objc dynamic var locationlongitude: String!
    
    @objc dynamic var notes : String!
    @objc dynamic var loginUserID : String!

    func initData(isWheezing:String?,isCough:String?,isChestTightness:String?,isDifficultyBreathing:String?,addDateAndTime:String?,possibleTrigger:String?,location:String?,locationLatitude:String?,locationlongitude:String?,notes:String?)
    {
        self.isWheezing = isWheezing ?? ""
        self.isCough = isCough ?? ""
        self.isChestTightness = isChestTightness ?? ""
        self.isDifficultyBreathing = isDifficultyBreathing ?? ""
        self.addDateAndTime = addDateAndTime ?? ""
        self.possibleTrigger = possibleTrigger ?? ""
        self.location = location ?? ""
        self.locationLatitude = locationLatitude ?? ""
        self.locationlongitude = locationlongitude ?? ""
        self.notes = notes ?? ""
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy hh:mm a"
        let datenew = formatter.date(from: addDateAndTime ?? "")
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "yyyy/MM/dd"
        let newdate = "\(formatter1.string(from: datenew ?? Date()))"
        self.addDate = newdate
       
        self.loginUserID = Constant.shared.getuserID()
        
    }
    
}
