//
//  VersionViewController.swift
//  BTStream
//
//  Created by 서혁규 on 2020/11/21.
//

import UIKit

class VersionViewController: UIViewController {

    @IBOutlet weak var versionn: UILabel!
    @IBOutlet weak var presentversion: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String

        if let version = version{
                print("version: \(version)")
            presentversion.text = "현재 버전 : \(version)"

        }


        // Do any additional setup after loading the view.
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
