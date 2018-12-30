//
//  UserDetailsViewController.swift
//  TestYoozoo
//
//  Created by Bhavesh on 30/12/18.
//  Copyright © 2018 Bhavesh. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController,testYoozooDelegate {
    var username:String = ""
    var userApi = UsersAPI()
    var userDetails:UserDetails? = nil
    
    @IBOutlet var navigationView: UIView!
    
    
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var viewFollowers: UIButton!
    
    @IBOutlet var followersLabel: UILabel!
    @IBOutlet var updatedAtLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var gistsLabel: UILabel!
    @IBOutlet var reposLabel: UILabel!
    @IBOutlet var shareButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        if Connectivity.isConnectedToInternet() {
            userApi.testYoozooDelegate = self
            userApi.getUser(searchString: username)
            
        }else {
            self.showAlertMessage(titleStr: "", messageStr: "Internet is not available.")
        }
        // Do any additional setup after loading the view.
    }
    func snapshot() -> UIImage?
    {
        UIGraphicsBeginImageContext(self.view.frame.size)
        
        
        
        self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
    }
    @IBAction func share(_ sender: Any) {
        
        let screenShot = self.snapshot()
        let activityViewController : UIActivityViewController = UIActivityViewController(
            activityItems: [screenShot!], applicationActivities: nil)
        activityViewController.excludedActivityTypes = [
            UIActivity.ActivityType.assignToContact,
            UIActivity.ActivityType.saveToCameraRoll,
            UIActivity.ActivityType.postToFlickr,
            UIActivity.ActivityType.postToVimeo,
            UIActivity.ActivityType.postToTencentWeibo
        ]
        DispatchQueue.main.async
            {
                self.present(activityViewController, animated: true, completion: nil)
                if let popOver = activityViewController.popoverPresentationController {
                    popOver.sourceView = self.view
                    popOver.sourceRect = self.shareButton.frame
                    //popOver.barButtonItem
                }
        }
        
    }
    func UserDetails(userDetails: UserDetails?)
    {
        self.userDetails = userDetails
        usernameLabel.text = userDetails?.login
            
        nameLabel.text = userDetails?.name
        locationLabel.text = userDetails?.location
        
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy HH:mm:ss"
        let dateUpdated = dateFormatter1.date(from: (userDetails?.updated_at)!)
        
        updatedAtLabel.text = "Updated at \(dateFormatter.string(from: dateUpdated!))"
        followersLabel.text = "\((userDetails?.followers)!) followers"
        gistsLabel.text = "\((userDetails?.public_gists)!) public gists"
        reposLabel.text = "\((userDetails?.public_repos)!) public repos"
        
        userImageView?.sd_setImage(with: URL(string: (userDetails?.avatar_url)!), placeholderImage: nil)
        viewFollowers.isUserInteractionEnabled = true
    }

    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func viewFollowers(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FollowersViewController") as! FollowersViewController
        vc.username = (userDetails?.login)!
        self.navigationController?.pushViewController(vc, animated: true)
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
