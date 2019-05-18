//
//  ViewController.swift
//  GithubJSON
//
//  Created by MNA Developer on 17/05/2019.
//  Copyright © 2019 Naeem. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    var userString : String = ""
    
   
    
//   let url = "https://api.github.com/users/\(userNameTextField.text!)"
    
    
    
    var repoList = [gitData]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
    }


    @IBAction func checkButton(_ sender: UIButton) {
        
        let url = "https://api.github.com/users/\(userNameTextField.text!)/repos"

        Alamofire.request(url, method: .get).responseJSON {
            response in
            if response.result.isSuccess{
                print(" **************** Success ****************")
                let gitJSON : JSON = JSON(response.result.value!)
                print(gitJSON)
                self.gettingJSON(json: gitJSON)
                
            }else{
                print("Error \(String(describing: response.result.error))")
            }
        }
//        update()
    }
    
    
    func gettingJSON(json: JSON){
        
        let GitFor = json[].arrayValue
        for values in GitFor{
            let githubbbb = gitData()
            githubbbb.gitName = values["name"].stringValue
            githubbbb.gitLogin = values["owner"]["login"].stringValue
            githubbbb.gitDescrip = values["description"].stringValue
            githubbbb.gitFullName = values["full_name"].stringValue
//            gitHubData.gitName = values["name"].stringValue
//            gitHubData.gitRepo = values["public_repos"].intValue
          
            
            repoList.append(githubbbb)
        }
        
        tableView.reloadData()

    }
    
 
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "abcCell", for: indexPath) as! VaccinationTVC
        
        cell.loginLabel.text = repoList[indexPath.row].gitName
        
        print(cell.loginLabel.text)
        cell.nameLabel.text = repoList[indexPath.row].gitLogin
        print(cell.nameLabel.text)
        cell.fullName.text = repoList[indexPath.row].gitFullName
        cell.Description.text = repoList[indexPath.row].gitDescrip
        
        return cell
    }

}
