# githubapp

About the App:

This is a pseudo iOS application using the GitHub Users API with Search User & Display User Details.It is a Universal(iPhone & iPad) iOS Application with deployment target 9.0 with code developed in Swift 4.2.


Search User Screen:


Utilizes User API URL: 
var url = "https://api.github.com/search/users?q=\(searchString)&page=1"
Example: https://api.github.com/search/users?q=a&page=1 API to perform autocomplete search functionality in this screen for GitHub users , tapping on the entries will take the user to user details screen

Model : UserInfo.swift,Items.swift
View : UserTableViewCell.swift
Controller : ViewController.swift







































User Details Screen:

Utilizes User API URL: 
var url = "https://api.github.com/users/\(searchString)"
Example: https://api.github.com/users/A API to get user details in this screen for GitHub user,
displays details
§ login — Username on Github
§ avatar_url — Avatar image url used to display image
§ followers_url — API URL containing followers details of particular user (JSON
Response) utilised to show followers on tap of View Button
§ location — Text: containing Location of the user
§ name — Text: Full name of the user
§ public_repos — Number: containing count of public repository made by user
§ public_gists — Number: containing count of public gists (notes) made by user
§ followers — Number: containing count of current followers for particular user.
§ updated_at — Time: last update done by user

Model : UserDetails.swift
Controller : UserDetailsViewController.swift

























Followers Screen:

Utilizes User API URL: 
var url = “https://api.github.com/users/\(searchString)/followers"
Example: https://api.github.com/users/A/followers API to get user followers in this screen for GitHub user

Model : Items.swift
View : UserTableViewCell.swift
Controller : FollowersViewController.swift














































Share Functionality:

Can share user details to other apps Example: Print

Controller : UIActivityViewController








Setup:

Download & clone from url https://github.com/bhavesh24/githubapp.git.Use your team under signing to run on any iOS 9.0+ devices(iPhone & iPad)
