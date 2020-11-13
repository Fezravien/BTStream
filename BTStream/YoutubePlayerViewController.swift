import UIKit
import YoutubePlayer_in_WKWebView

class YoutubePlayerViewController: UIViewController {
    
    @IBOutlet weak var playerView: WKYTPlayerView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        playerView.loadWithVideoId("gdZLi9oWNZg")
//        let url = URL(string: "https://img.youtube.com/vi/gdZLi9oWNZg/0.jpg")
//        let data = try? Data(contentsOf: url!)
//        thumbnail.image = UIImage(data: data!)
        let playVarsDic = ["playsinline": 1]
        playerView.load(withVideoId: "psL_5RIBqnY", playerVars: playVarsDic)

    }

}
