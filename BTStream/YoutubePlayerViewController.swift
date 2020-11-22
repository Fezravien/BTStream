import UIKit
import YoutubePlayerView

class YoutubePlayerViewController: UIViewController {
    @IBOutlet weak var playerView: YoutubePlayerView!
    var titles:String! = nil
    var videoIds:String! = nil
    var descriptions:String! = nil
    
   
    @IBOutlet weak var tit: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.loadWithVideoId("\(videoIds!)")
        tit.text = String(htmlEncodedString: titles)
        desc.text = String(htmlEncodedString: descriptions) 
        
    }

}
