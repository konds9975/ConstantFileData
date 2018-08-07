//
//  ReminderManager.swift
//  Cipla
//
//  Created by Hitendra Bhoir on 21/07/18.
//  Copyright © 2018 Fortune4 Technologies. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications
class ReminderManager: NSObject
{
    static let shared: ReminderManager =
    {
        let instance = ReminderManager()
        return instance
    }()
    let centre = UNUserNotificationCenter.current()
    override init()
    {
        super.init()
        
//        self.centre.requestAuthorization(options: [.alert, .sound ,.badge]) { (granted, error) in
//          UNUserNotificationCenter.current().delegate = self
//        }
//        
//        
//        let rememberMeLater = UNNotificationAction.init(identifier: "Remind me later", title: "Remind me later", options: UNNotificationActionOptions.destructive)
//        
//        let yes = UNNotificationAction.init(identifier: "Yes", title: "Yes", options: UNNotificationActionOptions.foreground)
//        
//        let no = UNNotificationAction.init(identifier: "No", title: "No", options: UNNotificationActionOptions.foreground)
//        
//        let categories = UNNotificationCategory.init(identifier: "Categeory", actions: [yes,no,rememberMeLater], intentIdentifiers: [], options: [])
//        
//        self.centre.setNotificationCategories([categories])
    }

}




/*

//
//  ReminderManager.swift
//  Cipla
//
//  Created by Hitendra Bhoir on 21/07/18.
//  Copyright © 2018 Fortune4 Technologies. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications
class ReminderManager: NSObject
{
    static let shared: ReminderManager =
    {
        let instance = ReminderManager()
        return instance
    }()
 
    override init()
    {
        super.init()
        let centre = UNUserNotificationCenter.current()
        centre.requestAuthorization(options: [.alert, .sound ,.badge]) { (granted, error) in
            UNUserNotificationCenter.current().delegate = self
        }
 
 
    }
 
}
extension ReminderManager: UNUserNotificationCenterDelegate {
 
    func getDailyTrigger(datetime:Date) -> UNCalendarNotificationTrigger
    {
        //triggerDaily
        let triggerDaily = Calendar.current.dateComponents([.hour, .minute, .second], from: datetime)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
        return trigger
        //triggerDaily
    }
    func getWeeklyTriggre(datetime:Date) -> UNCalendarNotificationTrigger {
 
        //triggerWeekly
        let triggerWeekly = Calendar.current.dateComponents([.weekday, .hour, .minute, .second], from: datetime)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerWeekly, repeats: true)
        return trigger
        //triggerWeekly
    }
    func getInstantTriggre() -> UNTimeIntervalNotificationTrigger {
 
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        return trigger
    }
    func setTriggerToParticularDate(dateTime:Date) -> UNCalendarNotificationTrigger
    {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents(in: .current, from: dateTime)
        let newComponents = DateComponents(calendar: calendar, timeZone: .current, month: components.month, day: components.day, hour: components.hour, minute: components.minute)
        let trigger = UNCalendarNotificationTrigger(dateMatching: newComponents, repeats: false)
        return trigger
    }
    func getOneMiniuteSnoozeTrigger(snoozeMinute:Int) -> UNCalendarNotificationTrigger {
        let now = Date()
        let snoozeMinute = snoozeMinute
        let calendar = Calendar(identifier: .gregorian)
        let snoozeTime =  (calendar as NSCalendar).date(byAdding: NSCalendar.Unit.minute, value: snoozeMinute, to: now, options:.matchStrictly)!
        let newDate = Date(timeInterval: 1, since: snoozeTime)
        let components = calendar.dateComponents(in: .current, from: newDate)
        let newComponents = DateComponents(calendar: calendar, timeZone: .current, month: components.month, day: components.day, hour: components.hour, minute: components.minute)
        let trigger = UNCalendarNotificationTrigger(dateMatching: newComponents, repeats: false)
        return trigger
    }
    func sheduleNotificationForDrAppoinment(date1:Date,info:Dictionary<String,String>,triggerNew:UNCalendarNotificationTrigger)
    {
        let centre = UNUserNotificationCenter.current()
        centre.getNotificationSettings { (settings) in
            if settings.authorizationStatus != UNAuthorizationStatus.authorized {
                print("Not Authorised")
            } else {
                print("Authorised")
                let content = UNMutableNotificationContent()
                content.title = info["title"] ?? ""
                content.body = info["body"] ?? ""
                UserDefaults.standard.setNotificationCount(value: UserDefaults.standard.getNotificationCount()!+1)
                //content.badge = (UserDefaults.standard.getNotificationCount()! as NSNumber)
                content.categoryIdentifier = info["appointmentId"]!
                content.userInfo = info
                content.sound = UNNotificationSound.default()//UNNotificationSound(named: "bell.mp3")
                print(date1)
                let trigger = triggerNew //self.setTriggerToParticularDate(dateTime: date1)
                let request = UNNotificationRequest(identifier: info["appointmentId"] ?? "EMPTY", content: content, trigger: trigger)
                let center = UNUserNotificationCenter.current()
 
                let rememberMeLater = UNNotificationAction.init(identifier: "Remind me later", title: "Remind me later", options: UNNotificationActionOptions.destructive)
 
                let yes = UNNotificationAction.init(identifier: "Yes", title: "Yes", options: UNNotificationActionOptions.foreground)
 
                let no = UNNotificationAction.init(identifier: "No", title: "No", options: UNNotificationActionOptions.foreground)
 
                let categories = UNNotificationCategory.init(identifier: info["appointmentId"]!, actions: [yes,no,rememberMeLater], intentIdentifiers: [], options: [])
 
                centre.setNotificationCategories([categories])
 
                center.add(request, withCompletionHandler: nil)
            }
        }
    }
 
    func sheduleNotificationForInhalerDose(date1:Date,info:Dictionary<String,String>,triggerNew:UNCalendarNotificationTrigger)
    {
        let centre = UNUserNotificationCenter.current()
        centre.getNotificationSettings { (settings) in
            if settings.authorizationStatus != UNAuthorizationStatus.authorized {
                print("Not Authorised")
            } else {
                print("Authorised")
                let content = UNMutableNotificationContent()
                content.title = info["title"] ?? ""
                content.body = info["body"] ?? ""
                UserDefaults.standard.setNotificationCount(value: UserDefaults.standard.getNotificationCount()!+1)
                //content.badge = (UserDefaults.standard.getNotificationCount()! as NSNumber)
                content.categoryIdentifier = info["inhalerDoseId"]!
                content.userInfo = info
                content.sound = UNNotificationSound.default()//UNNotificationSound(named: "bell.mp3")
                print(date1)
                let trigger = triggerNew //self.setTriggerToParticularDate(dateTime: date1)
                let request = UNNotificationRequest(identifier: info["inhalerDoseId"] ?? "EMPTY", content: content, trigger: trigger)
                let center = UNUserNotificationCenter.current()
 
                let rememberMeLater = UNNotificationAction.init(identifier: "Remind me later", title: "Remind me later", options: UNNotificationActionOptions.destructive)
 
                let yes = UNNotificationAction.init(identifier: "Yes", title: "Yes", options: UNNotificationActionOptions.foreground)
 
                let no = UNNotificationAction.init(identifier: "No", title: "No", options: UNNotificationActionOptions.foreground)
 
                let categories = UNNotificationCategory.init(identifier: info["inhalerDoseId"]!, actions: [yes,no,rememberMeLater], intentIdentifiers: [], options: [])
 
                centre.setNotificationCategories([categories])
                print("Normal \(request)")
                center.add(request, withCompletionHandler: nil)
            }
        }
    }
    func sheduleNotificationForInhalerDoseSnooze(date1:Date,info:Dictionary<String,String>,triggerNew:UNCalendarNotificationTrigger)
    {
        let centre = UNUserNotificationCenter.current()
        centre.getNotificationSettings { (settings) in
            if settings.authorizationStatus != UNAuthorizationStatus.authorized {
                print("Not Authorised")
            } else {
                print("Authorised")
                let content = UNMutableNotificationContent()
                content.title = info["title"] ?? ""
                content.body = info["body"] ?? ""
                UserDefaults.standard.setNotificationCount(value: UserDefaults.standard.getNotificationCount()!+1)
                //content.badge = (UserDefaults.standard.getNotificationCount()! as NSNumber)
                content.categoryIdentifier = info["inhalerDoseId"]!//"snooze" + info["inhalerDoseId"]!
                content.userInfo = info
                content.sound = UNNotificationSound.default()//UNNotificationSound(named: "bell.mp3")
                print(date1)
                let trigger = triggerNew //self.setTriggerToParticularDate(dateTime: date1)
                let request = UNNotificationRequest(identifier: info["inhalerDoseId"]!, content: content, trigger: trigger)
                let center = UNUserNotificationCenter.current()
 
                let rememberMeLater = UNNotificationAction.init(identifier: "Remind me later", title: "Remind me later", options: UNNotificationActionOptions.destructive)
 
                let yes = UNNotificationAction.init(identifier: "Yes", title: "Yes", options: UNNotificationActionOptions.foreground)
 
                let no = UNNotificationAction.init(identifier: "No", title: "No", options: UNNotificationActionOptions.foreground)
 
                let categories = UNNotificationCategory.init(identifier: info["inhalerDoseId"]!, actions: [yes,no,rememberMeLater], intentIdentifiers: [], options: [])
 
                centre.setNotificationCategories([categories])
                print("Snooze \(request)")
                center.add(request, withCompletionHandler: nil)
 
            }
        }
    }
 
    func setDRAppoinment(doctorAppointmentDataModel:DoctorAppointmentDataModel)  {
 
        let drAppInfo = ["title":"Dr. Appoinment reminder","body":"Just a remind to you have an appoinment with Dr.\(doctorAppointmentDataModel.doctorName!). at \(doctorAppointmentDataModel.appoinmentTime!)","drName":doctorAppointmentDataModel.doctorName,"dateAndTime":doctorAppointmentDataModel.appoinmentDateAndTime,"appointmentId":doctorAppointmentDataModel.appointmentId,"reminderType":"DrReminder"]
        let formatter3 = DateFormatter()
        formatter3.dateFormat = "dd-MM-yyyy hh:mm a"
        let dateNew = formatter3.date(from: doctorAppointmentDataModel.appoinmentDateAndTime)
        self.sheduleNotificationForDrAppoinment(date1:dateNew ?? Date() , info: drAppInfo as! Dictionary<String, String>, triggerNew: self.setTriggerToParticularDate(dateTime: dateNew ?? Date()))
    }
    func setDRAppoinmentSnooze(doctorAppointmentDataModel:DoctorAppointmentDataModel)  {
 
        let drAppInfo = ["title":"Dr. Appoinment Reminder","body":"Just a reminder to you have an appoinment with Dr.\(doctorAppointmentDataModel.doctorName!). at \(doctorAppointmentDataModel.appoinmentTime!)","drName":doctorAppointmentDataModel.doctorName,"dateAndTime":doctorAppointmentDataModel.appoinmentDateAndTime,"appointmentId":doctorAppointmentDataModel.appointmentId,"reminderType":"DrReminder"]
        self.sheduleNotificationForDrAppoinment(date1: Date() , info: drAppInfo as! Dictionary<String, String>, triggerNew: self.getOneMiniuteSnoozeTrigger(snoozeMinute: 10))
 
    }
    func setInhalerDoseReminder(inhalerReminderDataModel:InhalerReminderDataModel)  {
 
        let drAppInfo = ["title":"Inhaler dose reminder","body":"Hey Just a remind to you have an take dose of '\(inhalerReminderDataModel.device!)'. at \(inhalerReminderDataModel.addTime!).\nMedication: '\(inhalerReminderDataModel.medication!)'\nNumber of puffs: '\(inhalerReminderDataModel.numberOfPuffs!)'\nFrequency: '\(inhalerReminderDataModel.frequency!)'","device":inhalerReminderDataModel.device!,"medication":inhalerReminderDataModel.medication!,"numberOfPuffs":inhalerReminderDataModel.numberOfPuffs!,"frequency":inhalerReminderDataModel.frequency!,"dosageDateTime":inhalerReminderDataModel.dosageDateTime!,"isOn":inhalerReminderDataModel.isOn!,"addTime":inhalerReminderDataModel.addTime!,"inhalerDoseId":inhalerReminderDataModel.inhalerDoseId!,"reminderType":"InhalerDoseReminder"]
        let formatter3 = DateFormatter()
        formatter3.dateFormat = "dd-MM-yyyy hh:mm a"
        let dateNew = formatter3.date(from: inhalerReminderDataModel.dosageDateTime)
        self.sheduleNotificationForInhalerDose(date1:dateNew ?? Date() , info: drAppInfo , triggerNew: self.getDailyTrigger(datetime: dateNew ?? Date()))
    }
    func setInhalerDoseReminderSnooze(inhalerReminderDataModel:InhalerReminderDataModel)  {
 
        let drAppInfo = ["title":"Inhaler dose reminder","body":"Hey Just a remind to you have an take dose of '\(inhalerReminderDataModel.device!)'. at \(inhalerReminderDataModel.addTime!).\nMedication: '\(inhalerReminderDataModel.medication!)'\nNumber of puffs: '\(inhalerReminderDataModel.numberOfPuffs!)'\nFrequency: '\(inhalerReminderDataModel.frequency!)'","device":inhalerReminderDataModel.device!   ,"medication":inhalerReminderDataModel.medication!,"numberOfPuffs":inhalerReminderDataModel.numberOfPuffs!,"frequency":inhalerReminderDataModel.frequency!,"dosageDateTime":inhalerReminderDataModel.dosageDateTime!,"isOn":inhalerReminderDataModel.isOn!,"addTime":inhalerReminderDataModel.addTime!,"inhalerDoseId":"snooze"+inhalerReminderDataModel.inhalerDoseId!,"reminderType":"InhalerDoseReminder"]
        self.sheduleNotificationForInhalerDoseSnooze(date1: Date() , info: drAppInfo, triggerNew: self.getOneMiniuteSnoozeTrigger(snoozeMinute: 1))
    }
 
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
 
        print("Test: \(response.notification.request.content.userInfo)")
        let responseDic = response.notification.request.content.userInfo
        switch response.actionIdentifier
        {
        case "Remind me later":
            print("Remind me later")
            completionHandler()
 
            if let reminderType = responseDic["reminderType"] as? String
            {
                if reminderType == "DrReminder"
                {
                    if let appointmentId = responseDic["appointmentId"] as? String
                    {
                        let temp = DBManager.shared.getDoctorAppointmentDataModel(appoinmentId: appointmentId)
                        if temp.count != 0
                        {
                            self.setDRAppoinmentSnooze(doctorAppointmentDataModel: temp[0])
                        }
 
                    }
 
                }
                else
                    if reminderType == "InhalerDoseReminder"
                    {
                        if let inhalerDoseId = responseDic["inhalerDoseId"] as? String
                        {
                            let nn = inhalerDoseId.replacingOccurrences(of: "snooze", with: "")
                            let temp = DBManager.shared.getInhalerReminderDataModel(inhalerDoseId: nn)
                            if temp.count != 0
                            {
                                let temp1 = temp[0]
                                self.setInhalerDoseReminderSnooze(inhalerReminderDataModel: temp1)
                                self.setInhalerDoseReminder(inhalerReminderDataModel: temp1)
                            }
 
                        }
 
                }
 
            }
 
        case "Yes":
            print("Yes")
            completionHandler()
            if let reminderType = responseDic["reminderType"] as? String
            {
                if reminderType == "DrReminder"
                {
                    if let appointmentId = responseDic["appointmentId"] as? String
                    {
 
 
                        let temp1 = DBManager.shared.getDoctorAppointmentDataModel(appoinmentId: appointmentId)
                        if temp1.count != 0
                        {
                            let temp = temp1[0];
                            DBManager.shared.updateDoctorAppointmentDataModel(doctorAppointmentDataModel: temp, doctorName: temp.doctorName, appoinmentDate: temp.appoinmentDate, appoinmentTime: temp.appoinmentTime, isAppoinmentComplete: "YES")
                        }
 
                    }
 
                }
            }
 
 
        case "No":
            print("No")
            completionHandler()
            if let reminderType = responseDic["reminderType"] as? String
            {
                if reminderType == "DrReminder"
                {
                    if let appointmentId = responseDic["appointmentId"] as? String
                    {
                        let temp1 = DBManager.shared.getDoctorAppointmentDataModel(appoinmentId: appointmentId)
                        if temp1.count != 0
                        {
                            let temp = temp1[0];
                            DBManager.shared.updateDoctorAppointmentDataModel(doctorAppointmentDataModel: temp, doctorName: temp.doctorName, appoinmentDate: temp.appoinmentDate, appoinmentTime: temp.appoinmentTime, isAppoinmentComplete: "NO")
                        }
 
                    }
 
                }
            }
 
 
        default:
            print("default")
            completionHandler()
        }
        completionHandler()
    }
 
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("Test Foreground: \(notification.request.identifier)")
 
        completionHandler([.alert, .sound,.badge])
    }
 
}


enum UserDefaultsKeys : String
{
    case notificationCount
 
}
extension UserDefaults
{
    func setNotificationCount(value: Int)
    {
        set(value, forKey: UserDefaultsKeys.notificationCount.rawValue)
        synchronize()
    }
    func getNotificationCount() -> Int?
    {
        return integer(forKey: UserDefaultsKeys.notificationCount.rawValue)
    }
}
*/



/*
 
 func setupReminder()  {
 
 UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) {(accepted, error) in
 if !accepted {
 print("Notification access denied.")
 }
 }
 
 let action = UNNotificationAction(identifier: "remindLater", title: "Remind me later", options: [])
 let action1 = UNNotificationAction(identifier: "Okremind", title: "Ok", options: [])
 let category = UNNotificationCategory(identifier: "myCategory", actions: [action,action1], intentIdentifiers: [], options: [])
 UNUserNotificationCenter.current().setNotificationCategories([category])
 }
 
 
 @objc func scheduleNotification(at date: Date ,info:NSMutableDictionary!) {
 let calendar = Calendar(identifier: .gregorian)
 let components = calendar.dateComponents(in: .current, from: date)
 let newComponents = DateComponents(calendar: calendar, timeZone: .current, month: components.month, day: components.day, hour: components.hour, minute: components.minute)
 let trigger = UNCalendarNotificationTrigger(dateMatching: newComponents, repeats: false)
 let content = UNMutableNotificationContent()
 
 content.title = info.value(forKey: "title") as! String
 content.body = info.value(forKey: "body") as! String
 content.sound = UNNotificationSound.default()//init(named: "bell.mp3")
 content.categoryIdentifier = "myCategory"
 if let path = Bundle.main.path(forResource: "logo", ofType: "png") {
 let url = URL(fileURLWithPath: path)
 
 do {
 let attachment = try UNNotificationAttachment(identifier: "logo", url: url, options: nil)
 content.attachments = [attachment]
 } catch {
 print("The attachment was not loaded.")
 }
 }
 
 let request = UNNotificationRequest(identifier: info.value(forKey: "dateAndTime") as! String , content: content, trigger: trigger)
 UNUserNotificationCenter.current().delegate = self
 UNUserNotificationCenter.current().removeAllDeliveredNotifications()
 UNUserNotificationCenter.current().add(request) {(error) in
 if let error = error {
 print("Uh oh! We had an error: \(error)")
 }
 }
 
 }
 
 
 
 //    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void)
 //    {
 //
 //    }
 
 //    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, for notification: UILocalNotification, withResponseInfo responseInfo: [AnyHashable : Any], completionHandler: @escaping () -> Void) {
 //        if identifier == "remindLater"
 //        {
 //            print(responseInfo)
 //            let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
 //            let now = Date()
 //            let snoozeMinute = 1
 //            let snoozeTime =  (calendar as NSCalendar).date(byAdding: NSCalendar.Unit.minute, value: snoozeMinute, to: now, options:.matchStrictly)!
 //
 //
 //            let selectedDate = Constant.shared.getDrAppointmentDate()
 //            let dic = NSMutableDictionary()
 //            dic.setValue("Appoinment Reminder", forKey:"title" )
 //            dic.setValue("Just a reminder to you have an appoinment with Dr.\(Constant.shared.getDrNameAppointment())", forKey:"body" )
 //            dic.setValue(selectedDate, forKey: "dateAndTime")
 //            let newDate = Date(timeInterval: 1, since: snoozeTime)
 //            scheduleNotification(at: newDate, info: dic)
 //        }
 //        else if identifier == "Okremind"
 //        {
 //
 //            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [Constant.shared.getDrAppointmentDate()])
 //        }
 //    }
 //    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Swift.Void) {
 //        completionHandler( [.alert, .sound])
 //    }
 //    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
 //        print("userInfo: \(userInfo.debugDescription)")
 //        completionHandler(UIBackgroundFetchResult.noData)
 //    }
 
 //    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
 //        // when app is onpen and in foregroud
 //        completionHandler(.alert)
 //    }
 //
 //    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
 //
 //        // get the notification identifier to respond accordingly
 //        let identifier = response.notification.request.identifier
 //
 //        // do what you need to do
 //        print(identifier)
 //        // ...
 //    }
 */
