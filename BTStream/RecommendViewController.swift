import UIKit

class RecommendViewController: HomeViewController {
    @IBOutlet weak var recommendTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    var segue_comfirm = ""
    var query = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getItem(query)
        collectionView.reloadData()
        sleep(1)
        
    }
    
}

extension RecommendViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendCell", for: indexPath) as! RecommendCell
        
        
        var url:URL?
        var data:Data?
        
        
        if self.segue_comfirm == "new" {
            DispatchQueue.main.async {
                url = URL(string: (self.new?.items[indexPath.row].snippet.thumbnails.medium.url)!)
                data = try? Data(contentsOf: url!)
            }
            
            
        } else if self.segue_comfirm == "hot" {
            DispatchQueue.main.async{
                url = URL(string: (self.hot?.items[indexPath.row].snippet.thumbnails.medium.url)!)
                data = try? Data(contentsOf: url!)
            }
            
        } else if self.segue_comfirm == "comment"{
            DispatchQueue.main.async{
                url = URL(string: (self.comment?.items[indexPath.row].snippet.thumbnails.medium.url)!)
                data = try? Data(contentsOf: url!)
            }
            
        }
        
        DispatchQueue.main.async {
            cell.thumbnail.image = UIImage(data: data!)
        }

        //}

        return cell
    }
    
}

extension RecommendViewController:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let player = storyboard?.instantiateViewController(identifier: "player") as? YoutubePlayerViewController else {
            return
        }
        
        if self.segue_comfirm == "new" {
        
            player.titles = new?.items[indexPath.row].snippet.title
            player.videoIds = new?.items[indexPath.row].id["videoId"]
            player.descriptions = new?.items[indexPath.row].snippet.description
            
        } else if self.segue_comfirm == "hot" {
            
            player.titles = hot?.items[indexPath.row].snippet.title
            player.videoIds = hot?.items[indexPath.row].id["videoId"]
            player.descriptions = hot?.items[indexPath.row].snippet.description
            
        } else {
            
            player.titles = comment?.items[indexPath.row].snippet.title
            player.videoIds = comment?.items[indexPath.row].id["videoId"]
            player.descriptions = comment?.items[indexPath.row].snippet.description
            
        }
        
        present(player, animated: true, completion: nil)
    }
}

extension RecommendViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 120)
    }
}



