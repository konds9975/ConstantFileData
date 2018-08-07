//
//  TriggerMapDataModel.swift
//  Cipla
//
//  Created by Hitendra Bhoir on 10/07/18.
//  Copyright © 2018 Fortune4 Technologies. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
class TriggerMapDataModel: Object
{
    @objc dynamic var trigger : String!
    @objc dynamic var location: String!
    @objc dynamic var locationLatitude: String!
    @objc dynamic var locationlongitude: String!
    @objc dynamic var notes : String!
    
    @objc dynamic var loginUserID : String!
    
    func initData(trigger:String?,location:String?,locationLatitude:String?,locationLongitude:String?,notes:String?)
    {
        self.trigger = trigger ?? ""
        self.location = location ?? ""
        self.locationLatitude = locationLatitude ?? ""
        self.locationlongitude = locationLongitude ?? ""
        self.notes = notes ?? ""
        self.loginUserID = Constant.shared.getuserID()
    
    }
  
}
