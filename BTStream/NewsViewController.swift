import UIKit

class NewsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableViewMain: UITableView!
    var newsData :Array<Dictionary<String,Any>>?

    
    func getNews(){
        let originalString = "http://newsapi.org/v2/everything?q=방탄소년단&apiKey=568fe86ad1fb4b7a9ebfdfe63a80ed74"
        let escapedString = originalString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

        // 기사 비동기 처리
        DispatchQueue.global(qos: .background).async {
            
    
            let task = URLSession.shared.dataTask(with: URL(string: escapedString!)!) { (data, response, error) in
                if let datajson = data {
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: datajson, options: []) as! Dictionary<String ,Any>
                        
                        let articles = json["articles"] as! Array<Dictionary<String, Any>>
                                 //print(articles)
                        
                        self.newsData = articles
                        
                        DispatchQueue.main.async{
                            self.tableViewMain.reloadData()
                        }
                        
                    } catch  {
                        
                    }
                }
            }
            
            task.resume()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let news = newsData{
            return news.count
        }
        else{
            return 0
        }
        
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
                    print("title " + title)
                    cell.TitleLabel.text = title
                }
                if let desc = r["description"] as? String{
                    print("desc " + desc)
                    cell.DescLabel.text = desc
                }
                if let image = r["urlToImage"] as? String{
                    print(image)
                    let url = URL(string: image)
                    if url != nil {
                    let data = try? Data(contentsOf: url!)
                        cell.TitleImage.image = UIImage(data: data!)

                    } else {
                        print("error")
                    }
//                    if data != nil{
//                    } else{
//                        print("error")
//                    }
                }
                
                
            }
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row) click")
//
//        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//        let controller = storyboard.instantiateViewController(identifier: "NewsDetailController") as! NewsDetailController
//
//        if let news = newsData{
//            let row = news[indexPath.row]
//
//            if let r = row as? Dictionary<String, Any>{
//
//                if let imageUrl = r["urlToImage"] as? String{
////                    print(imageUrl)
//                    controller.imageUrl = imageUrl
//
//
//                }
//                if let desc = r["description"] as? String{
////                    print(desc)
//                    controller.desc = desc
//
//                }
//            }
//        }
////        showDetailViewController(controller, sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, "NewsDetail" == id {
            if let controller = segue.destination as? NewsDetailController{
                
                if let news = newsData{
                    if let indexPath = tableViewMain.indexPathForSelectedRow{
                        let row = news[indexPath.row]
                        
                        if let r = row as? Dictionary<String, Any>{
                            
                            if let Url = r["url"] as? String{
                                print(Url)
                                controller.Url = Url
                            }
        
                            
                        }
                    }
                }
            }
        }
    }
    

    override func viewDidLoad() {
        
        let titleView = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width , height: (self.navigationController?.navigationBar.frame.height)!))
        titleView.textAlignment = .center
        titleView.textColor = .systemBlue
        titleView.font = .systemFont(ofSize: 28, weight: .heavy)
        titleView.text = "BTStream"
        self.navigationItem.titleView = titleView
        
        tableViewMain.delegate =  self
        tableViewMain.tableFooterView = UIView(frame: .zero)
        tableViewMain.dataSource = self
        tableViewMain.rowHeight = UITableView.automaticDimension
        super.viewDidLoad()

        getNews()
    }
    
}
