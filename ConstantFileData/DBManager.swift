//
//  DBManager.swift
//  Cipla
//
//  Created by Hitendra Bhoir on 10/07/18.
//  Copyright © 2018 Fortune4 Technologies. All rights reserved.
//


import Foundation
import UIKit
import RealmSwift
import UserNotifications
class DBManager: NSObject
{
    var realm : Realm!
    
    static let shared: DBManager = {
        let instance = DBManager()
        // setup code
        return instance
    }()
    
    // MARK: - Initialization Method
    override init() {
        super.init()
        realm = try! Realm()
    }
    
    func realmDataBaseSetup()
    {
        let realm = try! Realm()
        let folderPath = realm.configuration.fileURL!.deletingLastPathComponent().path
        print("Database Path\(folderPath)")
    }
    
    
    //MARK:-Trigger data opration
    func insertTriggerDataModels(triggerMapDataModel:[TriggerMapDataModel])
    {
        try! realm.write
        {
            realm.add(triggerMapDataModel)
            
        }
    }
    func getAllTriggerDataModels() -> [TriggerMapDataModel] {
        
        let triggerMapDataModelArray = realm.objects(TriggerMapDataModel.self).filter() { $0.loginUserID == Constant.shared.getuserID() }
        var dataSource = [TriggerMapDataModel]()
        dataSource.append(contentsOf: triggerMapDataModelArray)
        return dataSource.reversed()
    }
    func deleteTriggerDataModel(triggerMapDataModel:[TriggerMapDataModel])
    {
        try! realm.write
        {
            self.realm.delete(triggerMapDataModel)
            
        }
        
    }
    func updateTriggerMapDataModel(triggerMapDataModel:TriggerMapDataModel!,trigger:String?,location:String?,locationLatitude:String?,locationLongitude:String?,notes:String?)
    {
        try! realm.write
        {
            triggerMapDataModel.trigger = trigger ?? ""
            triggerMapDataModel.location = location ?? ""
            triggerMapDataModel.locationLatitude = locationLatitude ?? ""
            triggerMapDataModel.locationlongitude = locationLongitude ?? ""
            triggerMapDataModel.notes = notes ?? ""
            
        }
    }
    
    
    
    
    //MARK:-Symptom logbook data opration
    func insertSymptomLogbookModels(symptomLogbookModel:[SymptomLogbookModel])
    {
        try! realm.write
        {
            realm.add(symptomLogbookModel)
            
        }
    }
    func getAllSymptomLogbookModels() -> [SymptomLogbookModel] {
        
        let symptomLogbookModelArray = realm.objects(SymptomLogbookModel.self).filter() { $0.loginUserID == Constant.shared.getuserID() }
        var dataSource = [SymptomLogbookModel]()
        dataSource.append(contentsOf:symptomLogbookModelArray)
        return dataSource.reversed()
    }
    func getAllSymptomLogbookModelsSelected(date:String) -> [SymptomLogbookModel] {
        
        let symptomLogbookModelArray = realm.objects(SymptomLogbookModel.self).filter() { $0.addDate == date && $0.loginUserID == Constant.shared.getuserID()}
        
        var dataSource = [SymptomLogbookModel]()
        dataSource.append(contentsOf:symptomLogbookModelArray)
        return dataSource//.reversed()
    }
    func getAllSymptomLogbookModelDates() -> [String:UIColor] {
        
        let symptomLogbookModelListArray = realm.objects(SymptomLogbookModel.self).filter() { $0.loginUserID == Constant.shared.getuserID() }
        var dataSource = [SymptomLogbookModel]()
        dataSource.append(contentsOf: symptomLogbookModelListArray)
        var animDictionary:[String:UIColor] = [:]
        for temp in dataSource
        {
            animDictionary[temp.addDate] = UIColor.lightGray
        }
        return animDictionary
    }
    
    func deleteSymptomLogbookModel(symptomLogbookModel:[SymptomLogbookModel])
    {
        try! realm.write
        {
            self.realm.delete(symptomLogbookModel)
            
        }
        
    }
    func updateSymptomLogbookModel(symptomLogbookModel:SymptomLogbookModel!,isWheezing:String?,isCough:String?,isChestTightness:String?,isDifficultyBreathing:String?,addDateAndTime:String?,possibleTrigger:String?,location:String?,locationLatitude:String?,locationlongitude:String?,notes:String?)
    {
        try! realm.write
        {
            symptomLogbookModel.isWheezing = isWheezing ?? ""
            symptomLogbookModel.isCough = isCough ?? ""
            symptomLogbookModel.isChestTightness = isChestTightness ?? ""
            symptomLogbookModel.isDifficultyBreathing = isDifficultyBreathing ?? ""
            symptomLogbookModel.addDateAndTime = addDateAndTime ?? ""
            symptomLogbookModel.possibleTrigger = possibleTrigger ?? ""
            symptomLogbookModel.location = location ?? ""
            symptomLogbookModel.locationLatitude = locationLatitude ?? ""
            symptomLogbookModel.locationlongitude = locationlongitude ?? ""
            symptomLogbookModel.notes = notes ?? ""
            
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MMM-yyyy hh:mm a"
            let datenew = formatter.date(from: addDateAndTime ?? "")
            let formatter1 = DateFormatter()
            formatter1.dateFormat = "yyyy/MM/dd"
            let newdate = "\(formatter1.string(from: datenew ?? Date()))"
            symptomLogbookModel.addDate = newdate
        }
        
    }
    
    //MARK:-Log An Attack data opration
    func insertLogAnAttackModels(logAnAttackModel:[LogAnAttackModel])
    {
        try! realm.write
        {
            realm.add(logAnAttackModel)
            
        }
    }
    func getAllLogAnAttackModels() -> [LogAnAttackModel] {
        
        let logAnAttackModelArray = realm.objects(LogAnAttackModel.self).filter() { $0.loginUserID == Constant.shared.getuserID() }
        var dataSource = [LogAnAttackModel]()
        dataSource.append(contentsOf:logAnAttackModelArray)
        return dataSource.reversed()
    }
    func getAllLogAnAttackModelsSelected(date:String) -> [LogAnAttackModel] {
        
        let logAnAttackModelArray = realm.objects(LogAnAttackModel.self).filter() { $0.addDate == date && $0.loginUserID == Constant.shared.getuserID() }
        var dataSource = [LogAnAttackModel]()
        dataSource.append(contentsOf:logAnAttackModelArray)
        return dataSource//.reversed()
    }
    func getAllLogAnAttackModelDates() -> [String:UIColor] {
        
        let logAnAttackModelListArray = realm.objects(LogAnAttackModel.self).filter() { $0.loginUserID == Constant.shared.getuserID() }
        var dataSource = [LogAnAttackModel]()
        dataSource.append(contentsOf: logAnAttackModelListArray)
        var animDictionary:[String:UIColor] = [:]
        for temp in dataSource
        {
            animDictionary[temp.addDate] = UIColor.red
        }
        return animDictionary
    }
    func deleteLogAnAttackModel(logAnAttackModel:[LogAnAttackModel])
    {
        try! realm.write
        {
            self.realm.delete(logAnAttackModel)
            
        }
        
    }
    
    func updateLogAnAttackModel(logAnAttackModel:LogAnAttackModel!,addDateAndTime:String?,isRescueInhalerUsed:String?,noOfpuffs:String?,possibleTrigger:String?,location:String?,locationLatitude:String?,locationlongitude:String?,notes:String?)
    {
        try! realm.write
        {
            logAnAttackModel.addDateAndTime = addDateAndTime ?? ""
            logAnAttackModel.isRescueInhalerUsed = isRescueInhalerUsed ?? ""
            logAnAttackModel.noOfpuffs = noOfpuffs ?? ""
            logAnAttackModel.possibleTrigger = possibleTrigger ?? ""
            logAnAttackModel.location = location ?? ""
            logAnAttackModel.locationLatitude = locationLatitude ?? ""
            logAnAttackModel.locationlongitude = locationlongitude ?? ""
            logAnAttackModel.notes = notes ?? ""
            let formatter = DateFormatter()
            
            formatter.dateFormat = "dd-MMM-yyyy hh:mm a"
            let datenew = formatter.date(from: addDateAndTime ?? "")
            let formatter1 = DateFormatter()
            formatter1.dateFormat = "yyyy/MM/dd"
            let newdate = "\(formatter1.string(from: datenew ?? Date()))"
            logAnAttackModel.addDate = newdate
            
        }
    }
                                   
   
    
    //MARK:-Doctor Appoinment data opration
    func insertDoctorAppointmentDataModels(doctorAppointmentDataModel:[DoctorAppointmentDataModel])
    {
        try! realm.write
        {
            realm.add(doctorAppointmentDataModel)
            
        }
    }
    
    func isOpen(date:Date) -> Bool {
        
        switch date.compare(Date())
        {
            
            case .orderedAscending:
               return true
            case .orderedSame:
                print("The two dates are the same")
              return true
            case .orderedDescending:
                print("Date A is later than date B")
                return false
        }
    }
    
    func isGreterDate(date1:String,date2:String) -> Bool {
        
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd-MM-yyyy"
        let date11 = formatter1.date(from: date1) ?? Date()
        let date22 = formatter1.date(from: date2) ?? Date()
        switch date11.compare(date22)
        {
            
        case .orderedAscending:
            return true
        case .orderedSame:
            print("The two dates are the same")
            return true
        case .orderedDescending:
            print("Date A is later than date B")
            return false
        }
    }
    func getDoctorAppointmentDataModel(appoinmentId:String) -> [DoctorAppointmentDataModel] {
        
        let doctorAppointmentDataModelArray = realm.objects(DoctorAppointmentDataModel.self).filter() { $0.appointmentId == appoinmentId && $0.loginUserID == Constant.shared.getuserID() }
        var dataSource = [DoctorAppointmentDataModel]()
        dataSource.append(contentsOf: doctorAppointmentDataModelArray)
        return dataSource
    }
    func getAllDoctorAppointmentDataModels() -> ([DoctorAppointmentDataModel],[DoctorAppointmentDataModel]) {
        
        let doctorAppointmentDataModelArray = realm.objects(DoctorAppointmentDataModel.self).filter() { $0.loginUserID == Constant.shared.getuserID() }
        
        var nextAppdataSource = [DoctorAppointmentDataModel]()
        var previousAppdataSource = [DoctorAppointmentDataModel]()
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let date = "\(formatter.string(from: Date()))"
        
        for temp in doctorAppointmentDataModelArray
        {
            switch Constant.shared.getSringIntoDate(date: Constant.shared.convertFormatOfDate(date: temp.appoinmentDateAndTime, originalFormat: "dd-MM-yyyy hh:mm a", destinationFormat: "dd-MM-yyyy"), originalFormat: "dd-MM-yyyy").compare(Constant.shared.getSringIntoDate(date: date, originalFormat: "dd-MM-yyyy")) {
            
            case .orderedAscending:
                previousAppdataSource.append(temp)
                print("Date A is earlier than date B")
            case .orderedSame:
                 print("The two dates are the same")
                 nextAppdataSource.append(temp)
            case .orderedDescending:
                 print("Date A is later than date B")
                 nextAppdataSource.append(temp)
            }
            print("\( Constant.shared.getSringIntoDate(date: Constant.shared.convertFormatOfDate(date: temp.appoinmentDateAndTime, originalFormat: "dd-MM-yyyy hh:mm a", destinationFormat: "dd-MM-yyyy"), originalFormat: "dd-MM-yyyy")) DATE: \(Date()) \(temp.appoinmentDateAndTime)")
        }
        return (nextAppdataSource.reversed(),previousAppdataSource.reversed())
    }
    func getAllDoctorAppointmentDataModelsForCount() -> ([DoctorAppointmentDataModel]) {
        
        let doctorAppointmentDataModelArray = realm.objects(DoctorAppointmentDataModel.self).filter() { $0.isAppoinmentComplete == "YES" && $0.loginUserID == Constant.shared.getuserID() }
        
        var dataSource = [DoctorAppointmentDataModel]()
        dataSource.append(contentsOf:doctorAppointmentDataModelArray)
        return dataSource.reversed()
      
    }
    func deleteDoctorAppointmentDataModel(doctorAppointmentDataModel:[DoctorAppointmentDataModel])
    {
        let idApp = doctorAppointmentDataModel[0].appointmentId
        try! self.realm.write
        {
            self.realm.delete(doctorAppointmentDataModel)
        }
        self.deletedNotification(ID: idApp!)
        
    }
    func deletedNotification(ID:String)
    {
        
        let snooze = "snooze"+ID
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [ID,snooze])

    }
   
    func updateDoctorAppointmentDataModel(doctorAppointmentDataModel:DoctorAppointmentDataModel,doctorName:String?,appoinmentDate:String?,appoinmentTime:String?,isAppoinmentComplete:String?)
    {
        try! realm.write
        {
           
            doctorAppointmentDataModel.doctorName = doctorName ?? ""
            doctorAppointmentDataModel.appoinmentDate = appoinmentDate ?? ""
            doctorAppointmentDataModel.appoinmentTime = appoinmentTime ?? ""
            doctorAppointmentDataModel.isAppoinmentComplete = isAppoinmentComplete ?? ""
            
            
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyyy hh:mm a"
            let datenew = formatter.date(from:"\(appoinmentDate ?? "") \(appoinmentTime ?? "")")
            let formatter1 = DateFormatter()
            formatter1.dateFormat = "dd-MM-yyyy hh:mm a"
            let newdate = "\(formatter1.string(from: datenew ?? Date()))"
            doctorAppointmentDataModel.appoinmentDateAndTime = newdate
        }
    }
    
    
    
    //MARK:-Add inhaler reminder  data opration
    func insertInhalerReminderDataModels(inhalerReminderDataModel:[InhalerReminderDataModel])
    {
        try! realm.write
        {
            realm.add(inhalerReminderDataModel)
            
        }
    }
    
    
    func getInhalerReminderDataModel(inhalerDoseId:String) -> [InhalerReminderDataModel] {
        
        let inhalerReminderDataModelArray = realm.objects(InhalerReminderDataModel.self).filter() { $0.inhalerDoseId == inhalerDoseId && $0.loginUserID == Constant.shared.getuserID() }
        var dataSource = [InhalerReminderDataModel]()
        dataSource.append(contentsOf:inhalerReminderDataModelArray)
        return dataSource
    }
    func getAllInhalerReminderDataModels() -> [InhalerReminderDataModel] {
        
        let inhalerReminderDataModelArray = realm.objects(InhalerReminderDataModel.self).filter() { $0.loginUserID == Constant.shared.getuserID() }
        var dataSource = [InhalerReminderDataModel]()
        dataSource.append(contentsOf:inhalerReminderDataModelArray)
        return dataSource.reversed()
    }
    
    func deleteInhalerReminderDataModel(inhalerReminderDataModel:[InhalerReminderDataModel])
    {
        let inhalerId = inhalerReminderDataModel[0].inhalerDoseId
        try! realm.write
        {
            self.realm.delete(inhalerReminderDataModel)
            
        }
        self.deletedNotification(ID: inhalerId!)
    }
    
    func updateInhalerReminderDataModel(inhalerReminderDataModel:InhalerReminderDataModel!,device:String?,medication:String?,numberOfPuffs:String?,frequency:String?,dosageDateTime:String?,isOn:String?)
    {
        try! realm.write
        {
            inhalerReminderDataModel.device = device ?? ""
            inhalerReminderDataModel.medication = medication ?? ""
            inhalerReminderDataModel.numberOfPuffs = numberOfPuffs ?? ""
            inhalerReminderDataModel.frequency = frequency ?? ""
            inhalerReminderDataModel.dosageDateTime = dosageDateTime ?? ""
            inhalerReminderDataModel.isOn = isOn ?? "NO"
            
        }
    }
    
    
    //MARK:-Add PEFR reminder  data opration
    func insertpEFRReminderDataModels(pEFRReminderDataModel:[PEFRReminderDataModel])
    {
        try! realm.write
        {
            realm.add(pEFRReminderDataModel)
            
        }
    }
    
    func getAllPEFRReminderDataModel() -> [PEFRReminderDataModel] {
        
        let inhalerReminderDataModelArray = realm.objects(PEFRReminderDataModel.self).filter() { $0.loginUserID == Constant.shared.getuserID() }
        var dataSource = [PEFRReminderDataModel]()
        dataSource.append(contentsOf:inhalerReminderDataModelArray)
        return dataSource.reversed()
    }
    func getPEFRReminderDataModel(pefrID:String) -> [PEFRReminderDataModel] {
        
        let inhalerReminderDataModelArray = realm.objects(PEFRReminderDataModel.self).filter() { $0.pefrID == pefrID && $0.loginUserID == Constant.shared.getuserID() }
        var dataSource = [PEFRReminderDataModel]()
        dataSource.append(contentsOf:inhalerReminderDataModelArray)
        return dataSource.reversed()
    }
    func deletePefrNotification(pEFRReminderDataModel:[PEFRReminderDataModel])  {
        
        let idApp = pEFRReminderDataModel[0].pefrID
        
        var identifiersNotification = [String]()
        identifiersNotification.append(contentsOf: pEFRReminderDataModel[0].identifiersNotification)
        
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: identifiersNotification)
        self.deletedNotification(ID: idApp!)
        
    }
    
    func deletePEFRReminderDataModel(pEFRReminderDataModel:[PEFRReminderDataModel])
    {
        self.deletePefrNotification(pEFRReminderDataModel:pEFRReminderDataModel)
       
        try! realm.write
        {
            self.realm.delete(pEFRReminderDataModel)
            
        }
       
        
        
        
    }
    
    func updatepEFRReminderDataModel(pEFRReminderDataModel:PEFRReminderDataModel!,pefrTestDate:String?,reminderTiming:String?,repeateDays:[Int]!,isOn:String?,identifiersNotification:[String]!)
    {
        
        try! realm.write
        {
            pEFRReminderDataModel.pefrTestDate = pefrTestDate ?? ""
            pEFRReminderDataModel.reminderTiming = reminderTiming ?? ""
            pEFRReminderDataModel.isOn = isOn ?? "NO"
            
            pEFRReminderDataModel.repeateDays  = List<Int>()
            for temp in repeateDays
            {
                pEFRReminderDataModel.repeateDays.append(temp)
            }
            
            for temp in identifiersNotification
            {
                pEFRReminderDataModel.identifiersNotification.append(temp)
            }
        }
    }
    
    //MARK:-Add inhaler List  data opration
    func insertInhalerListDataModels(inhalerListDataModel:[InhalerListDataModel])
    {
        try! realm.write
        {
            realm.add(inhalerListDataModel)
            
        }
    }
    func getAllInhalerListDataModels(dateString:String) -> [InhalerListDataModel] {
        
        let inhalerListDataModelArray = realm.objects(InhalerListDataModel.self).filter() { DBManager.shared.isGreterDate(date1: $0.addDate, date2: dateString) && $0.loginUserID == Constant.shared.getuserID() }
        var dataSource = [InhalerListDataModel]()
        dataSource.append(contentsOf:inhalerListDataModelArray)
        return dataSource
    }
    
    func deleteInhalerListDataModel(inhalerListDataModel:[InhalerListDataModel])
    {
        try! realm.write
        {
            self.realm.delete(inhalerListDataModel)
            
        }
        
    }
    
    func updateInhalerListDataModel(inhalerListDataModel:InhalerListDataModel!,device:String?,medication:String?,numberOfPuffs:String?,frequency:String?,dosageDateTime:String?)
    {
        try! realm.write
        {
            inhalerListDataModel.device = device ?? ""
            inhalerListDataModel.medication = medication ?? ""
            inhalerListDataModel.numberOfPuffs = numberOfPuffs ?? ""
            inhalerListDataModel.frequency = frequency ?? ""
            inhalerListDataModel.dosageDateTime = dosageDateTime ?? ""
            
            
        }
    }
    
    
    
    
    
    //MARK:-Add inhaler date dose  data opration
    func insertInhalerDoseDateModels(inhalerDoseDateModel:[InhalerDoseDateModel])
    {
        try! realm.write
        {
            realm.add(inhalerDoseDateModel)
            
        }
    }
    func getInhalerStatusMessage() -> String
    {
        
        let gregorian = NSCalendar(calendarIdentifier: .gregorian)
        let currentDate = Date()
        let comps = NSDateComponents()
        comps.day = -1
        let minDate = gregorian?.date(byAdding: comps as DateComponents, to: currentDate, options: NSCalendar.Options(rawValue: 0))
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "dd-MM-yyyy"
        let newdate = "\(formatter1.string(from:minDate ?? Date()))"
        let cureentDate = "\(formatter1.string(from: Date()))"
        let particularDateInhalerListYesterDay = DBManager.shared.getAllInhalerListDataModels(dateString: newdate)
        let particularDateInhalerListCureentDay = DBManager.shared.getAllInhalerListDataModels(dateString: cureentDate)
        let arrayYesterday = DBManager.shared.getDataInhalerDoseDateModel(dateString: newdate)
        let arrayCurrentDay = DBManager.shared.getDataInhalerDoseDateModel(dateString: cureentDate)
        let allDose = DBManager.shared.getAllInhalerDoseDateModels()
        if allDose.count == 0
        {
            return "You haven't start your inhaler dose yet!"
        }
        else if arrayYesterday.count != 0
        {
            let temp = arrayYesterday[0]
            if particularDateInhalerListYesterDay.count == temp.inhalerIdArray.count
            {
                if arrayCurrentDay.count != 0
                {
                    let temp = arrayCurrentDay[0]
                    if particularDateInhalerListCureentDay.count == temp.inhalerIdArray.count
                    {
                         return "Good you have taken your inhaler dose on time"
                    }
                    else
                    {
                         return "You haven't taken your inhaler dose today"
                    }
                    
                }
                else
                {
                    return "You haven't taken your inhaler dose today"
                }
              
            }
            else
            {
                 return "You missed your inhaler dose yesterday"
            }
            
        }
        else
        {
            if arrayCurrentDay.count != 0
            {
                let temp = arrayCurrentDay[0]
                if particularDateInhalerListCureentDay.count == temp.inhalerIdArray.count
                {
                    return "Good you have taken your inhaler dose on time"
                }
                else
                {
                    return "You haven't taken your inhaler dose today"
                }
                
            }
            else
            {
                return "You haven't taken your inhaler dose today"
            }
        }
       // return ""
    }
    
    
    func getDataInhalerDoseDateModel(dateString:String!) -> [InhalerDoseDateModel] {
        
        let inhalerDoseDateModelArray = realm.objects(InhalerDoseDateModel.self).filter() { $0.date == dateString && $0.loginUserID == Constant.shared.getuserID() }
        var dataSource = [InhalerDoseDateModel]()
        dataSource.append(contentsOf: inhalerDoseDateModelArray)
        return dataSource.reversed()
    }
    func getAllInhalerDoseDateModels() -> [InhalerDoseDateModel] {
        
        let inhalerDoseDateModelArray = realm.objects(InhalerDoseDateModel.self).filter() { $0.loginUserID == Constant.shared.getuserID() }
        var dataSource = [InhalerDoseDateModel]()
        dataSource.append(contentsOf:inhalerDoseDateModelArray)
        return dataSource.reversed()
    }
    func deleteInhalerDoseDateModel(inhalerDoseDateModel:[InhalerDoseDateModel])
    {
        try! realm.write
        {
            self.realm.delete(inhalerDoseDateModel)
            
        }
        
    }
    func updateInhalerDoseDateModel(inhalerDoseDateModel:InhalerDoseDateModel!,date:String?,inhalerIdArray: [String]!)
    {
        try! realm.write
        {
            inhalerDoseDateModel.date = date ?? ""
            inhalerDoseDateModel.inhalerIdArray.removeAll()
            for temp in inhalerIdArray
            {
               inhalerDoseDateModel.inhalerIdArray.append(temp)
               
            }
           
        }
    }
    
    //*******************
    func getAllInhalerDates() -> [String:UIColor] {
        
        let inhalerDateListArray = realm.objects(InhalerDoseDateModel.self).filter() { $0.loginUserID == Constant.shared.getuserID() }
        var dataSource = [InhalerDoseDateModel]()
        dataSource.append(contentsOf: inhalerDateListArray)
        var animDictionary:[String:UIColor] = [:]
        
        for temp in dataSource
        {
            let inhalerListArray = DBManager.shared.getAllInhalerListDataModels(dateString: temp.date)
            if temp.inhalerIdArray.count == inhalerListArray.count
            {
                animDictionary[temp.date] = colorButton
            }
            else
            {
                animDictionary[temp.date] = UIColor.lightGray
            }
            
        }
        return animDictionary
    }
    //FOR GET GREEN COLOR DOSE
    func getAllInhalerGreenColorModel() -> [InhalerDoseDateModel] {
        
        let inhalerDateListArray = realm.objects(InhalerDoseDateModel.self).filter() { $0.loginUserID == Constant.shared.getuserID() }
        var dataSource = [InhalerDoseDateModel]()
        dataSource.append(contentsOf: inhalerDateListArray)
        var dataArray:[InhalerDoseDateModel] = [InhalerDoseDateModel]()
        for temp in dataSource
        {
            let inhalerListArray = DBManager.shared.getAllInhalerListDataModels(dateString: temp.date)
            if temp.inhalerIdArray.count == inhalerListArray.count
            {
                dataArray.append(temp)
            }
           
        }
        return dataArray
    }
    func getScoreAndLevel() -> (Int,Int) {
        
        let dosesCountScore = (DBManager.shared.getAllInhalerGreenColorModel().count)*10
        let pefrCountScore = (DBManager.shared.getAllAddPEFRDetailModels().count)*100
        let doctorVisitCountScore = (DBManager.shared.getAllDoctorAppointmentDataModelsForCount().count)*50
        let totalCureentScore = (dosesCountScore+pefrCountScore+doctorVisitCountScore)
        var dataArray = [LevelData]()
        dataArray.append(LevelData(level: 0, score: 0))
        dataArray.append(LevelData(level: 1, score: 100))
        dataArray.append(LevelData(level: 2, score: 250))
        dataArray.append(LevelData(level: 3, score: 500))
        dataArray.append(LevelData(level: 4, score: 900))
        dataArray.append(LevelData(level: 5, score: 1500))
        dataArray.append(LevelData(level: 6, score: 2350))
        dataArray.append(LevelData(level: 7, score: 3500))
        dataArray.append(LevelData(level: 8, score: 5100))
        dataArray.append(LevelData(level: 9, score: 7300))
      
      
        var level = 0
        for (index,temp) in dataArray.enumerated()
        {
            if temp.score <= totalCureentScore
            {
                level = index
               
            }
        }
        print("total Score : \(totalCureentScore) Level : \(level)")
        return (totalCureentScore,level)
    }
    
    //MARK:-Add detail model  data opration
    func insertAddPEFRDetailModels(addPEFRDetailModel:[AddPEFRDetailModel])
    {
        try! realm.write
        {
            realm.add(addPEFRDetailModel)
            
        }
    }
    func getDataAddPEFRDetailModel(date:Date!) -> [AddPEFRDetailModel] {
        
        let addPEFRDetailModelArray = realm.objects(AddPEFRDetailModel.self).filter{($0.currentPefrTestDate.compare(date) == .orderedSame  ) && $0.loginUserID == Constant.shared.getuserID() }
        var dataSource = [AddPEFRDetailModel]()
        dataSource.append(contentsOf: addPEFRDetailModelArray)
        return dataSource.reversed()
    }
    func getAllAddPEFRDetailModels() -> [AddPEFRDetailModel] {
        
        let addPEFRDetailModelArray = realm.objects(AddPEFRDetailModel.self).sorted(by: { $0.currentPefrTestDate.compare($1.currentPefrTestDate) == .orderedAscending}).filter {
            $0.loginUserID == Constant.shared.getuserID()
        }
        var dataSource = [AddPEFRDetailModel]()
        dataSource.append(contentsOf:addPEFRDetailModelArray)
         return dataSource
    }
    func getAllAddPEFRDetailModelsOfCureentMonth() -> [AddPEFRDetailModel] {
        
        let addPEFRDetailModelArray = realm.objects(AddPEFRDetailModel.self).sorted(by: { $0.currentPefrTestDate.compare($1.currentPefrTestDate) == .orderedAscending }).filter {(
            Calendar.current.component(.month, from: $0.currentPefrTestDate) == Calendar.current.component(.month, from: Date()))
            && $0.loginUserID == Constant.shared.getuserID()
        }
        var dataSource = [AddPEFRDetailModel]()
        dataSource.append(contentsOf:addPEFRDetailModelArray)
        return dataSource
    }
    
    func getAllAddPEFRDetailModelsOfQuaterlyData3Month() -> [AddPEFRDetailModel] {
        
        let addPEFRDetailModelArray = realm.objects(AddPEFRDetailModel.self).sorted(by: { $0.currentPefrTestDate.compare($1.currentPefrTestDate) == .orderedAscending }).filter {(
            Calendar.current.component(.month, from: $0.currentPefrTestDate) == Calendar.current.component(.month, from: Date()) || Calendar.current.component(.month, from: $0.currentPefrTestDate) == Calendar.current.component(.month, from:Calendar.current.date(byAdding: .month, value: -1, to: Date())!) || Calendar.current.component(.month, from: $0.currentPefrTestDate) == Calendar.current.component(.month, from:Calendar.current.date(byAdding: .month, value: -2, to: Date())!)
        ) && $0.loginUserID == Constant.shared.getuserID()
        }
        
        var dataSource = [AddPEFRDetailModel]()
        dataSource.append(contentsOf:addPEFRDetailModelArray)
        return dataSource
    }
    func getAllAddPEFRDetailModelsOf6Month() -> [AddPEFRDetailModel] {
        
        let addPEFRDetailModelArray = realm.objects(AddPEFRDetailModel.self).sorted(by: { $0.currentPefrTestDate.compare($1.currentPefrTestDate) == .orderedAscending }).filter {(
            Calendar.current.component(.month, from: $0.currentPefrTestDate) == Calendar.current.component(.month, from: Date()) || Calendar.current.component(.month, from: $0.currentPefrTestDate) == Calendar.current.component(.month, from:Calendar.current.date(byAdding: .month, value: -1, to: Date())!) || Calendar.current.component(.month, from: $0.currentPefrTestDate) == Calendar.current.component(.month, from:Calendar.current.date(byAdding: .month, value: -2, to: Date())!) || Calendar.current.component(.month, from: $0.currentPefrTestDate) == Calendar.current.component(.month, from:Calendar.current.date(byAdding: .month, value: -3, to: Date())!) || Calendar.current.component(.month, from: $0.currentPefrTestDate) == Calendar.current.component(.month, from:Calendar.current.date(byAdding: .month, value: -4, to: Date())!) || Calendar.current.component(.month, from: $0.currentPefrTestDate) == Calendar.current.component(.month, from:Calendar.current.date(byAdding: .month, value: -5, to: Date())!))
            && $0.loginUserID == Constant.shared.getuserID()
        }
        
        var dataSource = [AddPEFRDetailModel]()
        dataSource.append(contentsOf:addPEFRDetailModelArray)
        return dataSource
    }
    func getAllAddPEFRDetailModels(minimumDate:Date,maximumDate:Date) -> [AddPEFRDetailModel] {
        
        let gregorian = NSCalendar(calendarIdentifier: .gregorian)
        let currentDate = minimumDate
        let comps = NSDateComponents()
        comps.day = -1
        let minDate = gregorian?.date(byAdding: comps as DateComponents, to: currentDate, options: NSCalendar.Options(rawValue: 0))
        
        let addPEFRDetailModelArray = realm.objects(AddPEFRDetailModel.self).sorted(by: { $0.currentPefrTestDate.compare($1.currentPefrTestDate) == .orderedAscending }).filter {(
            $0.currentPefrTestDate.compare(minDate!) == .orderedDescending &&   $0.currentPefrTestDate.compare(maximumDate) == .orderedAscending)
           && $0.loginUserID == Constant.shared.getuserID()
        }
        
        var dataSource = [AddPEFRDetailModel]()
        dataSource.append(contentsOf:addPEFRDetailModelArray)
        return dataSource
    }
    
    
    
    func deleteAddPEFRDetailModel(addPEFRDetailModel:[AddPEFRDetailModel])
    {
        try! realm.write
        {
            self.realm.delete(addPEFRDetailModel)
            
        }
        
    }
    func updateAddPEFRDetailModel(addPEFRDetailModel:AddPEFRDetailModel!,predictivePefrScore:String?,currentPefrTestDate:Date?,currentPefrScore:String?)
    {
        try! realm.write
        {
            addPEFRDetailModel.predictivePefrScore = predictivePefrScore ?? ""
            addPEFRDetailModel.currentPefrTestDate = currentPefrTestDate ?? Date()
            addPEFRDetailModel.currentPefrScore = currentPefrScore ?? ""
        
        }
    
    }
  
    //ReportListDataModel
    func insertReportListDataModels(reportListDataModel:[ReportListDataModel])
    {
        try! realm.write
        {
            realm.add(reportListDataModel)
            
        }
    }
    func getAllReportListDataModels() -> [ReportListDataModel] {
        
        let ReportListDataModelArray = realm.objects(ReportListDataModel.self).filter() { $0.loginUserID == Constant.shared.getuserID() }
        var dataSource = [ReportListDataModel]()
        dataSource.append(contentsOf:ReportListDataModelArray)
        return dataSource
    }
    func deleteReportListDataModels(reportListDataModels:[ReportListDataModel])
    {
        try! realm.write
        {
            self.realm.delete(reportListDataModels)
            
        }
        
    }
    
    //PrescriptionListDataModel
    func insertPrescriptionListDataModels(prescriptionListDataModel:[PrescriptionListDataModel])
    {
        try! realm.write
        {
            realm.add(prescriptionListDataModel)
            
        }
    }
    func getAllPrescriptionListDataModels() -> [PrescriptionListDataModel] {
        
        let prescriptionListDataModelArray = realm.objects(PrescriptionListDataModel.self).filter() { $0.loginUserID == Constant.shared.getuserID() }
        var dataSource = [PrescriptionListDataModel]()
        dataSource.append(contentsOf:prescriptionListDataModelArray)
        return dataSource
    }
    func deletePrescriptionListDataModel(prescriptionListDataModel:[PrescriptionListDataModel])
    {
        try! realm.write
        {
            self.realm.delete(prescriptionListDataModel)
            
        }
        
    }
    
    
    
    //PrescriptionListDataModel
    func insertContactInfoModels(contactInfoModel:[ContactInfoModel])
    {
        try! realm.write
        {
            realm.add(contactInfoModel)
            
        }
    }
    func updateContactInfoModel(contactInfoModel:ContactInfoModel,contactId:String?,conatctName:String?,contactNumber:String?)
    {
        try! realm.write
        {
            contactInfoModel.contactId = contactId ?? ""
            contactInfoModel.conatctName = conatctName ?? ""
            contactInfoModel.contactNumber = contactNumber ?? ""
            
        }
    }
    func getContactInfoModel(id1:String) -> [ContactInfoModel] {
        
        let contactInfoListDataModelArray = realm.objects(ContactInfoModel.self).filter() { $0.contactId == id1 && $0.loginUserID == Constant.shared.getuserID() }
        var dataSource = [ContactInfoModel]()
        dataSource.append(contentsOf:contactInfoListDataModelArray)
        return dataSource
    }
    
    func getContactInfoModelForCall() -> [ContactInfoModel] {
        
        let contactInfoListDataModelArray = realm.objects(ContactInfoModel.self).filter() { $0.loginUserID == Constant.shared.getuserID() }
            var dataSource = [ContactInfoModel]()
            dataSource.append(contentsOf:contactInfoListDataModelArray)
            return dataSource.sorted { $0.contactId < $1.contactId }
       
    }
    
    func getAllContactInfoModels() -> [ContactInfoModel] {
        
        let contactInfoListDataModelArray = realm.objects(ContactInfoModel.self).filter() { $0.loginUserID == Constant.shared.getuserID() }
        var dataSource = [ContactInfoModel]()
        dataSource.append(contentsOf:contactInfoListDataModelArray)
        return dataSource.sorted { $0.contactId < $1.contactId }
    }
    func deleteContactInfoModel(contactInfoModel:[ContactInfoModel])
    {
        try! realm.write
        {
            self.realm.delete(contactInfoModel)
            
        }
        
    }
    
    
    
    
    //UserInfoMaodel
    func insertUserInfoMaodels(userInfoMaodel:[UserInfoMaodel])
    {
        try! realm.write
        {
            realm.add(userInfoMaodel)
            
        }
    }
    func updateUserInfoMaodel(userInfoMaodel:UserInfoMaodel,iAmUserType : String?,firstName : String?,lastName : String?,emailID : String?,userName : String?, password : String?,mobileNumber : String?,city : String?,dateOfBirth : String?,heightInInch : String?, gender : String?,userprofileImage : Data?,userId:String!)
    {
        try! realm.write
        {
            userInfoMaodel.iAmUserType = iAmUserType ?? ""
            userInfoMaodel.firstName = firstName ?? ""
            userInfoMaodel.lastName = lastName ?? ""
            userInfoMaodel.emailID = emailID ?? ""
            userInfoMaodel.userName = userName ?? ""
            userInfoMaodel.password = password ?? ""
            userInfoMaodel.mobileNumber = mobileNumber ?? ""
            userInfoMaodel.city = city ?? ""
            userInfoMaodel.dateOfBirth = dateOfBirth ?? ""
            userInfoMaodel.heightInInch = heightInInch ?? ""
            userInfoMaodel.gender = gender ?? ""
            userInfoMaodel.userprofileImage = userprofileImage ?? Data()
            userInfoMaodel.userId = userId
        
        }
    }
    
    func getUserInfoMaodel(userName:String,password:String) -> ([UserInfoMaodel],String) {
        
        let userInfoListDataModelArray = realm.objects(UserInfoMaodel.self).filter() { $0.userName == userName && $0.password == password }
        var dataSource = [UserInfoMaodel]()
        dataSource.append(contentsOf:userInfoListDataModelArray)
        
        let userInfoListDataModelArray1 = realm.objects(UserInfoMaodel.self).filter() { $0.userName == userName}
        var dataSource1 = [UserInfoMaodel]()
        dataSource1.append(contentsOf:userInfoListDataModelArray1)
        
        var message = ""
        if dataSource1.count != 0
        {
            if dataSource1[0].password != password
            {
                message = "Please enter valid password"
            }
        
        }
        else
        {
            message = "Please enter valid user name and password"
        }
        
        return (dataSource,message)
    }
    func getUserInfoMaodel(userID:String) -> ([UserInfoMaodel]) {
        
        let userInfoListDataModelArray = realm.objects(UserInfoMaodel.self).filter() { $0.userId == userID }
        var dataSource = [UserInfoMaodel]()
        dataSource.append(contentsOf:userInfoListDataModelArray)
        return dataSource
    }
    func deleteUserInfoMaodel(userInfoMaodel:[UserInfoMaodel])
    {
        try! realm.write
        {
            self.realm.delete(userInfoMaodel)
            
        }
        
    }
    
    
    
}









//        ReminderManager.shared.firstTask(doctorAppointmentDataModel: doctorAppointmentDataModel[0]) { (ss) in
//
//            if ss
//            {
//                do
//                {
//
//
//                }
//                catch
//                {
//                    print(error)
//                }
//
//            }
//        }
