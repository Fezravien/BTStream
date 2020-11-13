//
//  SetViewController.swift
//  BTStream
//
//  Created by 윤재웅 on 2020/10/30.
//

import UIKit

class SetViewController: UITableViewController {
    
//    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        
        let titleView = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width , height: (self.navigationController?.navigationBar.frame.height)!))
        titleView.textAlignment = .center
        titleView.textColor = .systemBlue
        titleView.font = .systemFont(ofSize: 28, weight: .heavy)
        titleView.text = "BTStream"
        self.navigationItem.titleView = titleView
        
        super.viewDidLoad()
//        tableView.delegate =  self
//        tableView.dataSource = self
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                print("\(indexPath.row) click")
    }
 
    
}
//extension SetViewController:  UITableViewDelegate, UITableViewDataSource{
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var array = ["Notice","Version","General","Help","Contact"]
//
//        //let cell = UITableViewCell.init(style: .default, reuseIdentifier: "Type1")
//        let cell = tableView.dequeueReusableCell(withIdentifier: "FCell", for: indexPath)
//        cell.textLabel?.text = "\(indexPath.row)  \(array[indexPath.row])"
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("\(indexPath.row) click")
//
//    }
//}
