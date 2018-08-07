//
//  Constant.swift
//  Cipla
//
//  Created by IOSdeveloper on 27/12/17.
//  Copyright © 2017 IOSdeveloper. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation
//MARK:- API URL LIST

let baseUrl = "http://192.168.10.200:8181/cipla/code"

let urlAboutAsthma = "http://192.168.10.200:8181/cipla/code/api/about-asthma" //baseUrl + "/api/about-asthma"










let colorButtonBlackNew = UIColor(displayP3Red: 53/256.0, green: 43/256.0, blue: 22/256.0, alpha: 1)
let colorLightestGrey = UIColor(displayP3Red: 248/256.0, green: 250/256.0, blue: 251/256.0, alpha: 1)
let colorButton = UIColor(displayP3Red: 136/256.0, green: 204/256.0, blue: 92/256.0, alpha: 1)
let colorBottomGreyLine = UIColor(displayP3Red: 170/256.0, green: 170/256.0, blue: 170/256.0, alpha: 1)
let colorBottomDarkLine = UIColor(displayP3Red: 170/256.0, green: 170/256.0, blue: 170/256.0, alpha: 1)

let progressFirstColor = UIColor(displayP3Red: 151/256.0, green: 202/256.0, blue: 79/256.0, alpha: 1)
let progressSecondColorColor = UIColor(displayP3Red: 25/256.0, green: 230/256.0, blue: 170/256.0, alpha: 1)


let colorCode303030 = UIColor(displayP3Red: 48/256.0, green: 48/256.0, blue: 48/256.0, alpha: 1)
let colorCode114114114 = UIColor(displayP3Red: 114/256.0, green: 114/256.0, blue: 114/256.0, alpha: 0.84)
let buttonDark106106106 = UIColor(displayP3Red: 106/256.0, green: 106/256.0, blue: 106/256.0, alpha: 1)

//let colorBottomDarkLine = UIColor(displayP3Red: 136/256.0, green: 204/256.0, blue: 92/256.0, alpha: 1)


class Constant: NSObject
{
    var activityViewBack : UIView?
    var activityViewSubBack : UIView?
    var activityView : UIActivityIndicatorView!
    class var shared: Constant
    {
        struct Static
        {
            static let instance: Constant = Constant()
        }
        return Static.instance
    }
    struct AppFont
    {
        static let Georgia = "Georgia"
        static let Trajan = "TrajanPro-Regular"
    }
    struct AppMessage
    {
        
        static let ProjectTitle = "Cipla"
        static let kMessageNoInternetConnection = "Please check your internet connection"
        static let somthingWrongMsg = "Something went wrong. Please try again."
    }
    struct AppUrl
    {
        
        static let token = "http://192.168.10.201/workspace/harsh/drupal/project/services/session/token"
        
        static let base = "http://192.168.10.201/workspace/harsh/drupal/project/test_service_api/user/"
        static let login = base + "login"
        static let logout = base + "logout"
       
        struct loginParameter
        {
            static let username = "username"
            static let password = "password"
          
        }
        
        static let faqDetailUrl = "https://www.breathefree.com/faq-api/get"
        static let stateUrl = "https://www.breathefree.com/location/get/"
        static let clinicDetailUrl = "https://www.breathefree.com/clinic/get/"
    
    }
    struct AppColor
    {
        static let blackColorLight = UIColor(displayP3Red: 0/256.0, green: 0/256.0, blue: 0/256.0, alpha: 0.4)
        static let navigationColor = UIColor.white //(displayP3Red: 0/256.0, green: 0/256.0, blue: 0/256.0, alpha: 1.0)
        static let textColorYello = UIColor(displayP3Red: 215/256.0, green: 161/256.0, blue: 52/256.0, alpha: 1.0)
        
    }
    
    func getPossibleTriggerOtions() -> NSMutableArray{
        let array = NSMutableArray()
        let dic1 = NSMutableDictionary()
        dic1.setValue("Dust", forKey: "title")
        dic1.setValue("1", forKey: "id")
        array.add(dic1)
        let dic2 = NSMutableDictionary()
        dic2.setValue("Cigarette smoke", forKey: "title")
        dic2.setValue("2", forKey: "id")
        array.add(dic2)
        let dic3 = NSMutableDictionary()
        dic3.setValue("Air pollutants (Smoke from fireworks, exhaust fumes etc.)", forKey: "title")
        dic3.setValue("3", forKey: "id")
        array.add(dic3)
        let dic4 = NSMutableDictionary()
        dic4.setValue("Air sprays (Room fresheners / deodorants etc)", forKey: "title")
        dic4.setValue("4", forKey: "id")
        array.add(dic4)
        
        let dic5 = NSMutableDictionary()
        dic5.setValue("Pollen", forKey: "title")
        dic5.setValue("4", forKey: "id")
        array.add(dic5)
        
        let dic6 = NSMutableDictionary()
        dic6.setValue("Pets", forKey: "title")
        dic6.setValue("4", forKey: "id")
        array.add(dic6)
        
        let dic7 = NSMutableDictionary()
        dic7.setValue("Occupational triggers", forKey: "title")
        dic7.setValue("4", forKey: "id")
        array.add(dic7)
        
        let dic8 = NSMutableDictionary()
        dic8.setValue("Viral and bacterial infections", forKey: "title")
        dic8.setValue("4", forKey: "id")
        array.add(dic8)
        
        let dic9 = NSMutableDictionary()
        dic9.setValue("Medication", forKey: "title")
        dic9.setValue("4", forKey: "id")
        array.add(dic9)
        
        let dic10 = NSMutableDictionary()
        dic10.setValue("Food and Colouring agents", forKey: "title")
        dic10.setValue("4", forKey: "id")
        array.add(dic10)
        
        let dic11 = NSMutableDictionary()
        dic11.setValue("Weather", forKey: "title")
        dic11.setValue("4", forKey: "id")
        array.add(dic11)
        
        let dic12 = NSMutableDictionary()
        dic12.setValue("Moulds and fungi", forKey: "title")
        dic12.setValue("4", forKey: "id")
        array.add(dic12)
        
        let dic13 = NSMutableDictionary()
        dic13.setValue("Strong emotions", forKey: "title")
        dic13.setValue("4", forKey: "id")
        array.add(dic13)
        
        
        let dic14 = NSMutableDictionary()
        dic14.setValue("Exercise", forKey: "title")
        dic14.setValue("4", forKey: "id")
        array.add(dic14)
        return array
    }
    
    
   
    func getAddressFromLatLon(pdblLatitude: String, withLongitude pdblLongitude: String,lable:UILabel) {
        
        if activityView == nil
        {
            activityView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
            activityView?.center = lable.center
            activityView?.frame = CGRect(x: lable.frame.width - 25
                , y: lable.frame.height/2-5, width: 20, height: 20)
            lable.addSubview(activityView!)
            activityView?.startAnimating()
           
            
        }
        activityView?.isHidden = false
        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
        let lat: Double = Double("\(pdblLatitude)")!
        let lon: Double = Double("\(pdblLongitude)")!
        let ceo: CLGeocoder = CLGeocoder()
        center.latitude = lat
        center.longitude = lon
        let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)
        var addressString : String = ""
        ceo.reverseGeocodeLocation(loc, completionHandler:
            {(placemarks, error) in
                if (error != nil)
                {
                    print("reverse geodcode fail: \(error!.localizedDescription)")
                }
                let pm = placemarks! as [CLPlacemark]
                
                if pm.count > 0 {
                    let pm = placemarks![0]
                    if pm.subLocality != nil {
                        addressString = addressString + pm.subLocality! + ", "
                    }
                    if pm.thoroughfare != nil {
                        addressString = addressString + pm.thoroughfare! + ", "
                    }
                    if pm.locality != nil {
                        addressString = addressString + pm.locality! + ", "
                    }
//                    if pm.country != nil {
//                        addressString = addressString + pm.country! + ", "
//                    }
//                    if pm.postalCode != nil {
//                        addressString = addressString + pm.postalCode! + " "
//                    }
                    print(addressString)
                    lable.text = addressString
                    self.activityView?.isHidden = true
                }
        })
       
    }
    func prsentFirstTimeDashboardTutorial(viewController:UIViewController)
    {
        
        if (UserDefaults.standard.object(forKey: "dashboard") as? String) == nil
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HelpVC") as! HelpVC
            vc.openFor = "dashboard"
            vc.modalPresentationStyle = .overCurrentContext
            viewController.navigationController?.pushViewController(vc, animated: false)
        }
    }
    func prsentFirstTimesymptomlogbookTutorial(viewController:UIViewController)
    {
        
        if (UserDefaults.standard.object(forKey: "symptomlogbook") as? String) == nil
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HelpVC") as! HelpVC
            vc.openFor = "symptomlogbook"
            vc.modalPresentationStyle = .overCurrentContext
            viewController.navigationController?.pushViewController(vc, animated: false)
        }
    }
    func prsentFirstTimeinhalerusagetrackerTutorial(viewController:UIViewController)
    {
        
        if (UserDefaults.standard.object(forKey: "inhalerusagetracker") as? String) == nil
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HelpVC") as! HelpVC
            vc.openFor = "inhalerusagetracker"
            vc.modalPresentationStyle = .overCurrentContext
            viewController.navigationController?.pushViewController(vc, animated: false)
        }
    }
    func prsentFirstTimepEFERTutorial(viewController:UIViewController)
    {
        
        if (UserDefaults.standard.object(forKey: "pEFER") as? String) == nil
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HelpVC") as! HelpVC
            vc.openFor = "pEFER"
            vc.modalPresentationStyle = .overCurrentContext
            viewController.navigationController?.pushViewController(vc, animated: false)
        }
    }
    func prsentFirstTimereportTutorial(viewController:UIViewController)
    {
        
        if (UserDefaults.standard.object(forKey: "report") as? String) == nil
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HelpVC") as! HelpVC
            vc.openFor = "report"
            vc.modalPresentationStyle = .overCurrentContext
            viewController.navigationController?.pushViewController(vc, animated: false)
        }
    }
    func prsentFirstTimeremindersTutorial(viewController:UIViewController)
    {
        
        if (UserDefaults.standard.object(forKey: "reminders") as? String) == nil
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HelpVC") as! HelpVC
            vc.openFor = "reminders"
            vc.modalPresentationStyle = .overCurrentContext
            viewController.navigationController?.pushViewController(vc, animated: false)
        }
    }
    func prsentFirstTimesOSTutorial(viewController:UIViewController)
    {
        
        if (UserDefaults.standard.object(forKey: "sOS") as? String) == nil
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HelpVC") as! HelpVC
            vc.openFor = "sOS"
            vc.modalPresentationStyle = .overCurrentContext
            viewController.navigationController?.pushViewController(vc, animated: false)
        }
    }
    func prsentFirstTimetriggersTutorial(viewController:UIViewController)
    {
        
        if (UserDefaults.standard.object(forKey: "triggers") as? String) == nil
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HelpVC") as! HelpVC
            vc.openFor = "triggers"
            vc.modalPresentationStyle = .overCurrentContext
            viewController.navigationController?.pushViewController(vc, animated: false)
        }
    }
    func prsentFirstTimelocateUsTutorial(viewController:UIViewController)
    {
        
        if (UserDefaults.standard.object(forKey: "locateUs") as? String) == nil
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HelpVC") as! HelpVC
            vc.openFor = "locateUs"
            vc.modalPresentationStyle = .overCurrentContext
            viewController.navigationController?.pushViewController(vc, animated: false)
        }
    }
    func prsentFirstTimeasthmaActionTutorial(viewController:UIViewController)
    {
        
        if (UserDefaults.standard.object(forKey: "asthmaAction") as? String) == nil
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HelpVC") as! HelpVC
            vc.openFor = "asthmaAction"
            vc.modalPresentationStyle = .overCurrentContext
            viewController.navigationController?.pushViewController(vc, animated: false)
        }
    }
    func prsentFirstTimemyasthmaActionTutorial(viewController:UIViewController)
    {
        
        if (UserDefaults.standard.object(forKey: "myasthmaAction") as? String) == nil
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HelpVC") as! HelpVC
            vc.openFor = "myasthmaAction"
            vc.modalPresentationStyle = .overCurrentContext
            viewController.navigationController?.pushViewController(vc, animated: false)
        }
    }
    
    
    func setNavigatiobarColor(color:UIColor)
    {
        UINavigationBar.appearance().barTintColor = color
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().isTranslucent = false
        let myAttribute = [ NSAttributedStringKey.font: UIFont(name: "JosefinSans-Bold", size: 22.0)! , NSAttributedStringKey.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = myAttribute
    }
    func setNavigationTitle(_titleText:String) -> UILabel
    {
        //self.navigationItem.titleView = Constant.sharedInstance.setNavigationTitle(_titleText: "Example Title")
        let tlabel = UILabel(frame: CGRect(x: 0, y: 5, width: (UIApplication.shared.keyWindow?.frame.size.width)!/2, height: 50))
        tlabel.numberOfLines = 0
        tlabel.text = _titleText
        tlabel.textColor = Constant.AppColor.textColorYello
        tlabel.textAlignment = .center
        tlabel.font = UIFont(name:Constant.AppFont.Trajan , size: 21)
        tlabel.backgroundColor = UIColor.clear
        tlabel.adjustsFontSizeToFitWidth = true
        tlabel.minimumScaleFactor = 0.5
        
        return tlabel
    }
    func setBorderToTextField(myTextField : UITextField ,placeholder : String)
    {
        //Constant.sharedInstance.setBorderToTextField(myTextField: self.nameText, placeholder: "ENTER YOUR NAME")
        myTextField.layer.borderColor = Constant.AppColor.textColorYello.cgColor
        myTextField.layer.borderWidth = 1
        myTextField.layer.cornerRadius = 0
        myTextField.layer.masksToBounds = true
//        myTextField.attributedPlaceholder = NSAttributedString(string:placeholder, attributes:[((kCTForegroundColorAttributeName as NSAttributedStringKey) as NSAttributedStringKey) as NSAttributedStringKey: Constant.AppColor.textColorYello,kCTFontAttributeName :UIFont(name: Constant.AppFont.Georgia, size: 18)!])
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 7, height: myTextField.frame.size.height))
        myTextField.leftView = paddingView
        myTextField.leftViewMode = .always
        myTextField.font = UIFont(name:Constant.AppFont.Georgia, size: 18)!
        myTextField.textColor = Constant.AppColor.textColorYello
        
    }
    func setBorderToTextView(myTextView : UITextView)
    {
        
        myTextView.layer.borderColor = Constant.AppColor.textColorYello.cgColor
        myTextView.layer.borderWidth = 1
        myTextView.layer.cornerRadius = 0
        myTextView.layer.masksToBounds = true
        myTextView.font = UIFont(name: Constant.AppFont.Georgia, size: 18)!
        myTextView.textColor = Constant.AppColor.textColorYello
        
        
    }
    func setBorderToView(myView : UIView)
    {
        myView.layer.borderColor = Constant.AppColor.textColorYello.cgColor
        myView.layer.borderWidth = 1
        myView.layer.cornerRadius = 0
        myView.layer.masksToBounds = true
        
        
        
    }
    
    func getSringIntoDate(date: String, originalFormat: String) -> Date {
        
        // Orginal format :
        let dateOriginalFormat = DateFormatter()
        dateOriginalFormat.dateFormat = originalFormat      // in the example it'll take "yy MM dd" (from our call)
        
        if let date1 = dateOriginalFormat.date(from: date)
        {
            return date1
        }
        else
        {
            return Date()
        }
    }
    
    func convertFormatOfDate(date: String, originalFormat: String, destinationFormat: String) -> String! {
        
        // Orginal format :
        let dateOriginalFormat = DateFormatter()
        dateOriginalFormat.dateFormat = originalFormat      // in the example it'll take "yy MM dd" (from our call)
        
        // Destination format :
        let dateDestinationFormat = DateFormatter()
        dateDestinationFormat.dateFormat = destinationFormat // in the example it'll take "EEEE dd MMMM yyyy" (from our call)
        
        // Convert current String Date to NSDate
        if let dateFromString = dateOriginalFormat.date(from: date)
        {
            // Convert new NSDate created above to String with the good format
            let dateFormated = dateDestinationFormat.string(from: dateFromString)
            return dateFormated
        }
        else
        {
            return "Date not Avilable"
        }
        
    }
    
    func getGreetingWithName(name:String!)->String!
    {
        let dateComponents = Calendar.current.dateComponents([.hour], from: Date())
    
        if let hour = dateComponents.hour
        {
            var greetingString: String!
            greetingString = ""
            
            if (hour >  0)
            {
                greetingString = "Mornin' Sunshine, " + name; // REALLY early
            }
            if (hour >  6)
            {
                greetingString = "Good Morning, " + name;      // After 6am
            }
            if (hour > 12)
            {
                greetingString = "Good Afternoon, " + name;    // After 12pm
            }
            if (hour > 17)
            {
                greetingString = "Good Evening, " + name;      // After 5pm
            }
            if (hour > 22)
            {
                greetingString = "Go To Bed, " + name;
            }
            
//
//            switch hour
//            {
//                case 0..<12:
//                greetingString = "Good Morning, " + name
//                case 12..<17:
//                greetingString = "Good Afternoon, " + name
//                default:
//                greetingString = "Good Evening, " + name
//
//            }
            return greetingString
        }
        return name
    }
    
    
    func showAlert(projectTitle : String , message : String)
    {
        DispatchQueue.main.async
            {
                
        let alert=UIAlertController(title:nil, message: message, preferredStyle: UIAlertControllerStyle.alert);
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction) in
            
        }));
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil);
        }
        
    }
    func readStateJson() -> NSArray? {
        do {
            if let file = Bundle.main.url(forResource: "StateList", withExtension: "json")
            {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    
                    if let data = object["data"] as? NSDictionary
                    {
                        if let list = data.value(forKey: "list") as? NSArray
                        {
                            return list
                            
                        }
                        else
                        {
                            return nil
                        }
                    }
                    else
                    {
                        return nil
                    }
                    
                } else if let object = json as? [Any] {
                    // json is an array
                    print(object)
                }
                else
                {
                    print("JSON is invalid")
                }
            }
            else
            {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    func readCityJson() -> NSArray? {
        do {
            if let file = Bundle.main.url(forResource: "Mha", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    
                    if let data = object["data"] as? NSDictionary
                    {
                        if let list = data.value(forKey: "list") as? NSArray
                        {
                            return list
                            
                        }
                        else
                        {
                            return nil
                        }
                    }
                    else
                    {
                        return nil
                    }
                    
                } else if let object = json as? [Any] {
                    // json is an array
                    print(object)
                }
                else
                {
                    print("JSON is invalid")
                }
            }
            else
            {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    func readProductListJson() -> NSArray? {
        do {
            
            
            if let file = Bundle.main.url(forResource: "copd_products", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? NSArray
                {
                    return object
                }
                else
                {
                    return nil
                }
                
            }
            else
            {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    
    
    func isValidEmail(testStr:String) -> Bool
    {
 
        
        let stricterFilterString = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}"
       
         let emailTest = NSPredicate(format:"SELF MATCHES %@", stricterFilterString)
        return emailTest.evaluate(with: testStr)
    }
    func addBadge(barButon : UIBarButtonItem , number : Int)
    {
        if number == 0
        {
            barButon.removeBadge()
        }
        else
        {
            barButon.addBadge(number: number)
        }
        
    }
    func showIndicator(view:UIView )
    {
        DispatchQueue.main.async
        {
            if self.activityViewBack == nil
            {
                self.activityViewBack = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
                self.activityViewSubBack = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                self.activityViewSubBack?.backgroundColor = UIColor.groupTableViewBackground.withAlphaComponent(0.8)
                self.activityViewSubBack?.cornerRadius = 10
                self.activityViewSubBack?.center = (self.activityViewBack?.center)!
                self.activityViewBack?.addSubview(self.activityViewSubBack!)
                
                self.activityView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
                self.activityView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
                self.activityView.startAnimating()
                self.activityViewBack?.addSubview(self.activityView)
                
                self.activityView.color = colorButton
                view.addSubview(self.activityViewBack!)
                UIApplication.shared.keyWindow?.isUserInteractionEnabled = false
                
            }
            else
            {
                self.hideIndicator()
            }
        }
       
    }
    func hideIndicator()
    {
        DispatchQueue.main.async
        {
            DispatchQueue.main.async
            {
                self.activityViewBack?.removeFromSuperview()
                self.activityViewBack?.isHidden = true
                self.activityViewBack = nil
                 UIApplication.shared.keyWindow?.isUserInteractionEnabled = true
            }
        }
    }
    
   
}


//MARK:-Set userdefault values count
extension Constant
{
    
    func setDrAppointmentDate(date : String)
    {
        UserDefaults.standard.set(date, forKey: "setDrAppointmentDate")
        
    }
    func getDrAppointmentDate() -> String
    {
        
        if let status = UserDefaults.standard.object(forKey: "setDrAppointmentDate") as? String
        {
            return status
        }
        else
        {
            return ""
        }
        
    }
    
    func setDrNameAppointment(name : String)
    {
        UserDefaults.standard.set(name, forKey: "setDrNameAppointment")
        
    }
    func getDrNameAppointment() -> String
    {
        
        if let status = UserDefaults.standard.object(forKey: "setDrNameAppointment") as? String
        {
            return status
        }
        else
        {
            return ""
        }
        
    }
    
    
    
    
    
    
    func setUserLoginStatus(status : String)
    {
        UserDefaults.standard.set(status, forKey: "statusLogin")
        
    }
    func getUserLoginStatus() -> String
    {
        
        if let status = UserDefaults.standard.object(forKey: "statusLogin") as? String
        {
            return status
        }
        else
        {
            return "NO"
        }
        
    }
    
    func setDeviceId(deviceId : String)
    {
        UserDefaults.standard.set(deviceId, forKey: "deviceId")
        
    }
    func getDeviceId() -> String
    {
        
        if let deviceId = UserDefaults.standard.object(forKey: "deviceId") as? String
        {
            return deviceId
        }
        else
        {
            return ""
        }
        
    }
    func getDeviceTypeIOS() -> String
    {
        return "0"
    }
    
    func setCurrentLat(lat : String)
    {
        UserDefaults.standard.set(lat, forKey: "currentLat")
        
    }
    func getCurrentLat() -> String
    {
        
        if let lat = UserDefaults.standard.object(forKey: "currentLat") as? String
        {
            return lat
        }
        else
        {
            return "22.000000000"
        }
       
    }
    
    func setCurrentLong(long : String)
    {
        UserDefaults.standard.set(long, forKey: "currentLong")
        
    }
    func getCurrentLong() -> String
    {
        
        if let long = UserDefaults.standard.object(forKey: "currentLong") as? String
        {
            return long
        }
        else
        {
            return "-22.000000000"
        }
        
    }
    func setUserID(userID : String)
    {
        UserDefaults.standard.set(userID, forKey: "userID")
        
    }
    func getuserID() -> String
    {
        
        if let userID = UserDefaults.standard.object(forKey: "userID") as? String
        {
            return userID
        }
        else
        {
            return ""
        }
        
    }
    func setNotificationCount(count : String)
    {
        UserDefaults.standard.set(count, forKey: "notificationCount")
        
    }
    func getNotificationCount() -> Int
    {
       
        
        if let count = UserDefaults.standard.object(forKey: "notificationCount") as? String
        {
            return Int(count)!
        }
        else
        {
            return 0
        }
        
    }
    
    func setApiTokan(tokan : String) {
        
        UserDefaults.standard.set(tokan, forKey: "ApiTokan")
    }
    func getApiTokan() -> String {
        
        if let tokan = UserDefaults.standard.object(forKey: "ApiTokan") as? String
        {
            
            return tokan
        }
        else
        {
            return ""
        }
    }
    
    func setIsRememberMe(tokan : String) {
        
        UserDefaults.standard.set(tokan, forKey: "IsRememberMe")
    }
    func getIsRememberMe() -> String {
        
        if let isRememberMe = UserDefaults.standard.object(forKey: "IsRememberMe") as? String
        {
            
            return isRememberMe
        }
        else
        {
            return "NO"
        }
    }
    
    func setUserName(tokan : String) {
        
        UserDefaults.standard.set(tokan, forKey: "userName")
    }
    func getUserName() -> String {
        
        if let userName = UserDefaults.standard.object(forKey: "userName") as? String
        {
            
            return userName
        }
        else
        {
            return ""
        }
    }
    func setUserPassWord(tokan : String) {
        
        UserDefaults.standard.set(tokan, forKey: "UserPassWord")
    }
    func getUserPassWord() -> String {
        
        if let userPassWord = UserDefaults.standard.object(forKey: "UserPassWord") as? String
        {
            
            return userPassWord
        }
        else
        {
            return ""
        }
    }
    
    
    func setIsFirestTime(info : String) {
        
        UserDefaults.standard.set(info, forKey: "setIsFirestTimeInfo")
    }
    func getIsFirestTimeInfo() -> String {
        
        if let info = UserDefaults.standard.object(forKey: "setIsFirestTimeInfo") as? String
        {
            
            return info
        }
        else
        {
            return ""
        }
    }
    

}




