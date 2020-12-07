import UIKit

class HomeViewController: UIViewController {
    
    var hot: Yvideo?
    var new: Yvideo?
    var comment: Yvideo?
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

         if segue.identifier == "hot" {
            let distinationVC = segue.destination as? RecommendViewController
            //distinationVC?.youtubeItems_hot = self.hot
            distinationVC?.segue_comfirm = "hot"
            distinationVC?.query = "BTS"
            //distinationVC?.collectionView.reloadData()
            
            
        } else if segue.identifier == "new" {
            let distinationVC = segue.destination as? RecommendViewController
            //distinationVC?.youtubeItems_new = self.new
            distinationVC?.segue_comfirm = "new"
            distinationVC?.query = "방탄소년단"
            //distinationVC?.collectionView.reloadData()

        } else if segue.identifier == "comment" {
            let distinationVC = segue.destination as? RecommendViewController
            //distinationVC?.youtubeItems_comment = self.comment
            distinationVC?.segue_comfirm = "comment"
            distinationVC?.query = "방탄"
            //distinationVC?.collectionView.reloadData()

        }
    }
    
    override func viewDidLoad() {
        self.title="BTSteam"
    
    }
    
    
    func getItem(_ name:String){
        var sort:String = ""
        print("****** NAME: \(name)")
        if name == "BTS"{
            sort = "viewCount"
            
        } else if name == "방탄소년단"{
            sort = "relevance"
            
        } else if name == "방탄"{
            sort = "rating"
        }
        
        //AIzaSyDrv3wpQtsDgkJG-NJB-5dA0SA1CsqgmiE 혁규 key
        //AIzaSyCB_DKb9GqG4Ku8fcWAxqsvO0jFwJspxTM 재웅 key
        let url = "https://www.googleapis.com/youtube/v3/search?key=AIzaSyDrv3wpQtsDgkJG-NJB-5dA0SA1CsqgmiE&part=snippet&type=video&maxResults=5&videoEmbeddable=true&videoSyndicated=true&order=\(sort)&q=\(name)"
        
        
        let encodeUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let decoder = JSONDecoder()
        
        print("****** URL: \(encodeUrl)")
        
        let task = URLSession.shared.dataTask(with: URL(string: encodeUrl)!) { (data, response, error) in
           
            print("****** WORK: \(data)")
            
            guard error == nil else {
                print("****** ERROR *****")
                return
            }
            if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200{
                
                do {
                    let search = try decoder.decode(Yvideo.self, from: data)
                    print(search)
                    
                    if name == "BTS"{
                        self.hot = search
                        
                    } else if name == "방탄소년단"{
                        self.new = search
                        
                    } else if name == "방탄"{
                        self.comment = search
                    }
                   
                } catch {
                    return print("---> parsing error: \(error.localizedDescription)")
                }
            }
            
        }
        task.resume()
    }
    
    
    
}
