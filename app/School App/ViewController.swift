//
//  ViewController.swift
//  School App
//
//  Created by Technovation on 2020-03-05.
//  Copyright © 2020 Technovation. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db.collection("users").addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else {
                print("Error retreiving snapshots \(error!)")
                return
            }

            //print("Current data: \(snapshot.documents.map { $0.data() })")

            for document in snapshot.documents{
                let teamInfo = document.data()["name"] as? String ?? " "
                print("name: \(teamInfo)")
//                   let teams = teamInfo.map {$0.value}
//                   for team in teams {
//                       guard let validTeam = team as? Dictionary<String, Any> else {continue}
//                       let name = validTeam["name"] as? String ?? ""
//                       let officeId = validTeam["age"] as? String ?? ""
//                       print("name: \(team)")
//                   }
                
            }
        }

        
    }


}

