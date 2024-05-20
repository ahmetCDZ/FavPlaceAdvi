//
//  profileViewController.swift
//  FavPlaceAdvi
//
//  Created by Ahmet Zincir on 19.05.2024.
//

import UIKit
import Firebase

class profileViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addFunc))
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(logOutFunc))
    }
    
    @objc func addFunc(){
        self.performSegue(withIdentifier: "toDetailsVc", sender: nil)
    }
    @objc func logOutFunc(){
        do {
            try Auth.auth().signOut()
            print("Oturum başarıyla kapatıldı.")
        } catch let signOutError as NSError {
            print("Oturum kapatma hatası: \(signOutError.localizedDescription)")
        }
        self.performSegue(withIdentifier: "toSignUpVc", sender: nil)
        
    }



}
