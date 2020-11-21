//
//  wjdcorViewController.swift
//  BTStream
//
//  Created by 서혁규 on 2020/11/21.
//

import UIKit

class wjdcorViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableview: UITableView!
    var strArrayLa = ["개인정보 취급방침","이용약관","운영정책","오픈소스 라이선스"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCell(withIdentifier: "Type3", for: indexPath) as! Type3
        cell.TextLabel.text = "\(strArrayLa[indexPath.row])"

        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
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
