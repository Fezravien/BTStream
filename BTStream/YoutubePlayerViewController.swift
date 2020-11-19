import UIKit
import YoutubePlayerView

class YoutubePlayerViewController: UIViewController {
    @IBOutlet weak var playerView: YoutubePlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerView.loadWithVideoId("BflFNMl_UWY")
       
        
    }

}
