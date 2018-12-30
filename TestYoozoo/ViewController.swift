//
//  ViewController.swift
//  TestYoozoo
//
//  Created by Bhavesh on 29/12/18.
//  Copyright © 2018 Bhavesh. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController,testYoozooDelegate,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (userArray?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTableView.dequeueReusableCell(withIdentifier: "UserCell") as! UserTableViewCell
        
        if let name = userArray![indexPath.row].login
        {
            cell.userNameLabel.text = name as String
        }
        if let imageUrl = userArray?[indexPath.row].avatar_url
        {
            cell.userImageView?.sd_setImage(with: URL(string: imageUrl), placeholderImage: nil)
        }

        return cell
    }
    

    @IBOutlet var userTableView: UITableView!
    @IBOutlet var userTextField: RightViewPaddingTextfield!
    @IBOutlet var userTableHeightConstraint: NSLayoutConstraint!
    
    var userArray: [Items]? = []
    
        var userApi = UsersAPI()
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Search"))
        
        imageView.frame = CGRect(x: CGFloat(imageView.frame.size.width - 25.0), y: CGFloat(17), width: CGFloat(25), height: CGFloat(25))
        
        imageView.contentMode = .scaleAspectFill
        userTextField.rightView = imageView
        userTextField.rightViewMode = .always
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func updateViewConstraints() {
        self.userTableView.layoutIfNeeded()
        let frame = userTableView.frame
        if (userTableView.contentSize.height < self.view.frame.height - (frame.origin.y))
        {
            userTableHeightConstraint.constant = userTableView.contentSize.height
        }
        else
        {
            userTableHeightConstraint.constant = self.view.frame.height - (frame.origin.y)
        }

        super.updateViewConstraints()
    }
    

    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        if(textField == userTextField)
        {
            var substring = textField.text
            substring = (substring! as NSString).replacingCharacters(in: range, with: string)
            if substring?.count == 0 { 
                userTableView.isHidden = true
            }
            else {
                if Connectivity.isConnectedToInternet() {
                    userApi.testYoozooDelegate = self
                    userApi.getUsers(searchString: substring!)
                    
                }else {
                    self.showAlertMessage(titleStr: "", messageStr: "Internet is not available.")
                }
            }
        }
        return true
    }
    
    func UserInfo(userInfo: UserInfo?)
    {
        userArray = userInfo?.items
        userTableView.reloadData()
        updateViewConstraints()
        userTableView.isHidden = false
    }
    func failMessage(message: String?, statusCode: Int?)
    {
        showAlertMessage(titleStr: "", messageStr: message!)
        userTableView.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailsViewController") as! UserDetailsViewController
        vc.username = userArray![indexPath.row].login!
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

