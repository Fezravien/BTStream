import UIKit
import YoutubePlayerView

class MembersPlayerViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var youtubeItems:[Yvideo] = []
    var param:String!
    var url:URL!
    var data:Data!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getItem(param!)
   
    }
    
    func getItem(_ name:String){
        
        //AIzaSyDrv3wpQtsDgkJG-NJB-5dA0SA1CsqgmiE 혁규 key
        //AIzaSyCB_DKb9GqG4Ku8fcWAxqsvO0jFwJspxTM 재웅 key
        let url = "https://www.googleapis.com/youtube/v3/search?key=AIzaSyCB_DKb9GqG4Ku8fcWAxqsvO0jFwJspxTM&part=snippet&type=video&maxResults=5&videoEmbeddable=true&videoSyndicated=true&order=viewCount&q=\(name)"
        let encodeUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let decoder = JSONDecoder()
        
        DispatchQueue.global(qos: .background).async {
            let task = URLSession.shared.dataTask(with: URL(string: encodeUrl)!) { [self] (data, response, error) in
                do {
                    let search = try decoder.decode(Yvideo.self, from: data!)
                    //print("***\(search.items[0].id["videoId"]!)****")
                    
                    youtubeItems.append(search)
//                    print(youtubeItems[0].pageInfo["resultsPerPage"]!)
                    
                    DispatchQueue.main.async{
                        self.tableView.reloadData()
                    }

                } catch {
                    return print("---> parsing error: \(error.localizedDescription)")
                }
            }
                task.resume()
       }
        
    }
        
        
    
   
}
extension MembersPlayerViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //youtubeItems[0].pageInfo["resultsPerPage"]!
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "memCell") as? memCell else {
            return UITableViewCell()
        }
        if youtubeItems.isEmpty {
            sleep(1)
        }
        
        DispatchQueue.global(qos: .background).async {
            let url = URL(string:self.youtubeItems[0].items[indexPath.row].snippet.thumbnails.high.url)
            let data = try? Data(contentsOf: url!)
        
            DispatchQueue.main.async{
                cell.memimg.image = UIImage(data: data!)
                cell.title.text = String(htmlEncodedString: self.youtubeItems[0].items[indexPath.row].snippet.title)
            }
        }
        
        return cell
        
    }
    
}

extension MembersPlayerViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let player = storyboard?.instantiateViewController(identifier: "player") as? YoutubePlayerViewController else {
            return
        }
        
        player.titles = youtubeItems[0].items[indexPath.row].snippet.title
        player.videoIds = youtubeItems[0].items[indexPath.row].id["videoId"]
        player.descriptions = youtubeItems[0].items[indexPath.row].snippet.description
        

        present(player, animated: true, completion: nil)
    }
}


class memCell:UITableViewCell {

    @IBOutlet weak var memimg: UIImageView!
    @IBOutlet weak var title: UILabel!
    
}




extension String {

    init?(htmlEncodedString: String) {

        guard let data = htmlEncodedString.data(using: .utf8) else {
            return nil
        }

        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]

        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return nil
        }

        self.init(attributedString.string)

    }

}
