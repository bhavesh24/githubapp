//
//  FollowersViewController.swift
//  TestYoozoo
//
//  Created by Bhavesh on 30/12/18.
//  Copyright © 2018 Bhavesh. All rights reserved.
//

import UIKit

class FollowersViewController: UIViewController,testYoozooDelegate,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet var usersTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (userArray?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = usersTableView.dequeueReusableCell(withIdentifier: "UserCell") as! UserTableViewCell
        
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
    
    var username:String = ""
    var userApi = UsersAPI()
    var userArray: [Items]? = []
    func UserInfo(userInfo: [Items]?)
    {
        userArray = userInfo
        usersTableView.reloadData()
    }
    func failMessage(message: String?, statusCode: Int?)
    {
        showAlertMessage(titleStr: "", messageStr: message!)
        usersTableView.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        if Connectivity.isConnectedToInternet() {
            userApi.testYoozooDelegate = self
            userApi.getFollowers(searchString: username)
            
        }else {
            self.showAlertMessage(titleStr: "", messageStr: "Internet is not available.")
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
