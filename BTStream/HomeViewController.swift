//
//  HomeViewController.swift
//  BTStream
//
//  Created by 윤재웅 on 2020/10/30.
//

import UIKit

class HomeViewController: UIViewController {
    
    var hotViewController: MembersViewController!
    var newViewController: MembersViewController!
    var commentViewController: MembersViewController!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "hot" {
            let distinationVC = segue.destination as? MembersViewController
            hotViewController = distinationVC
            
            
        } else if segue.identifier == "new" {
            
        } else if segue.identifier == "comment" {
            
        }
    }
    
    override func viewDidLoad() {
        self.title="BTSteam"
    }
    
    
}
