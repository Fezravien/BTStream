import UIKit
import YoutubePlayerView

class YoutubePlayerViewController: UIViewController {
    @IBOutlet weak var playerView: YoutubePlayerView!
    @IBOutlet weak var thumbnail: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.loadWithVideoId("gdZLi9oWNZg")
        let url = URL(string: "https://img.youtube.com/vi/gdZLi9oWNZg/0.jpg")
        let data = try? Data(contentsOf: url!)
        thumbnail.image = UIImage(data: data!)
        
    }

}
