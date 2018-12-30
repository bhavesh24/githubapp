//
//  Utils.swift
//  TestYoozoo
//
//  Created by Bhavesh on 29/12/18.
//  Copyright © 2018 Bhavesh. All rights reserved.
//

import UIKit
import Alamofire

class RightViewPaddingTextfield: UITextField {
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let rightBounds = CGRect(x: bounds.size.width - 35, y: 12.5, width: 25, height: 25)
        
        return rightBounds
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}

class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

extension UIViewController {
    //Alert Show
    
    func showAlertMessage(titleStr:String, messageStr:String) {
        let alert = UIAlertController(title: titleStr, message: messageStr, preferredStyle: .alert)
        alert.view.tintColor = UIColor.black
        self.present(alert, animated: true, completion: nil)
        // change to desired number of seconds (in this case 5 seconds)
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when){
            // your code with delay
            alert.dismiss(animated: true, completion: nil)
        }
    }
    //Email id validation
    func emailValidation(emailId: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let emailResult = emailTest.evaluate(with: emailId)
        return emailResult
    }
    //phone number validation
    func phoneValidate(phoneNumber: String) -> Bool {
        let charcterSet  = NSCharacterSet(charactersIn: "0123456789").inverted
        let inputString = phoneNumber.components(separatedBy: charcterSet)
        let filtered = inputString.joined(separator: "")
        return  phoneNumber == filtered
    }
    
    @IBDesignable
    class DesignableView: UIView {
        @IBInspectable var cornerRadius: CGFloat = 0.0 {
            
            didSet {
                self.layer.cornerRadius = cornerRadius
            }
        }
        @IBInspectable var borderColor: UIColor? {
            didSet{
                self.layer.borderColor = borderColor?.cgColor
            }
        }
        @IBInspectable var borderWidth: CGFloat = 0.0 {
            didSet{
                self.layer.borderWidth = borderWidth
            }
        }
    }
    
}
