import UIKit

class RecommendViewController: UIViewController {
    @IBOutlet weak var recommendTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var youtubeItems:[Yvideo] = []
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
   
    
    func getItem(_ name:String){
        var sort:String = ""
        
        print("*****\(name)")
        if name == "BTS"{
            sort = "viewCount"
            
        } else if name == "방탄소년단"{
            sort = "relevance"
            
        } else if name == "방탄"{
            sort = "rating"
        }
      
        //AIzaSyDrv3wpQtsDgkJG-NJB-5dA0SA1CsqgmiE 혁규 key
        //AIzaSyCB_DKb9GqG4Ku8fcWAxqsvO0jFwJspxTM 재웅 key
        let url = "https://www.googleapis.com/youtube/v3/search?key=AIzaSyCB_DKb9GqG4Ku8fcWAxqsvO0jFwJspxTM&part=snippet&type=video&maxResults=5&videoEmbeddable=true&videoSyndicated=true&order=\(sort)&q=\(name)"
        let encodeUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let decoder = JSONDecoder()
        
        DispatchQueue.global(qos: .background).async {
            let task = URLSession.shared.dataTask(with: URL(string: encodeUrl)!) { [self] (data, response, error) in
                do {
                    let search = try decoder.decode(Yvideo.self, from: data!)
                    //print("***\(search.items[0].id["videoId"]!)****")
                    
                    youtubeItems.append(search)
//                    print(youtubeItems[0].pageInfo["resultsPerPage"]!)
                    
                    

                } catch {
                    return print("---> parsing error: \(error.localizedDescription)")
                }
            }
                task.resume()
       }
        
    }
}

extension RecommendViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendCell", for: indexPath) as! RecommendCell
        
            sleep(1)
     
        
        DispatchQueue.global(qos: .background).async {
            let url = URL(string:self.youtubeItems[0].items[indexPath.row].snippet.thumbnails.medium.url)
            let data = try? Data(contentsOf: url!)
        
            DispatchQueue.main.async {
                cell.thumbnail.image = UIImage(data: data!)
                collectionView.layoutIfNeeded()
            }
 
        }
        cell.setNeedsDisplay()
        cell.setNeedsLayout()
        cell.layoutSubviews()
        cell.layoutIfNeeded()
        

        return cell
    }
    
}

extension RecommendViewController:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let player = storyboard?.instantiateViewController(identifier: "player") as? YoutubePlayerViewController else {
            return
        }
        
        player.titles = youtubeItems[0].items[indexPath.row].snippet.title
        player.videoIds = youtubeItems[0].items[indexPath.row].id["videoId"]
        player.descriptions = youtubeItems[0].items[indexPath.row].snippet.description
        
        present(player, animated: true, completion: nil)
    }
}

extension RecommendViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 120)
    }
}



