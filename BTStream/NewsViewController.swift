//
//  NewsViewController.swift
//  BTStream
//
//  Created by 윤재웅 on 2020/10/30.
//

import UIKit

class NewsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableViewMain: UITableView!
    var newsData :Array<Dictionary<String,Any>>?
    
    func getNews(){
        let task = URLSession.shared.dataTask(with: URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=568fe86ad1fb4b7a9ebfdfe63a80ed74")!) { (data, response, error) in
            if let datajson = data {
                
                do {
                    let json = try JSONSerialization.jsonObject(with: datajson, options: []) as! Dictionary<String ,Any>
                    
                    let articles = json["articles"] as! Array<Dictionary<String, Any>>
           //         print(articles)
                    
                    self.newsData = articles
                    DispatchQueue.main.async{
                        self.tableViewMain.reloadData()
                    }
                    
                    //                    for(idx, value) in articles.enumerated(){
                    //                        if let v = value as? Dictionary<String, Any>{
                    //                            print("\(v["title"])")
                    //                            v["description"]
                    //                        }
                    //                    }
                } catch  {
                    
                }
            }
        }
        
        task.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let news = newsData{
            return news.count
        }
        else{
            return 0
        }
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "Type1")
        
        let cell = tableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        
        let idx = indexPath.row
        if let news = newsData{
            
            let row = news[idx]
                if let r = row as? Dictionary<String, Any>{
//                    v["description"]
                    
                    if let title = r["title"] as? String{
                        print(title)
                        cell.LabelText.text = title

                    }

                }
            }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row) click")
    }
    
    override func viewDidLoad() {
        tableViewMain.delegate =  self
        tableViewMain.dataSource = self
        
        getNews()
    }
    
}
