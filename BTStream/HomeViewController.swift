import UIKit

class HomeViewController: UIViewController {
    
    var url:URL!
    var data:Data!
    
    
    var hotViewController: RecommendViewController!
    var newViewController: RecommendViewController!
    var commentViewController: RecommendViewController!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

         if segue.identifier == "hot" {
            let distinationVC = segue.destination as? RecommendViewController
            hotViewController = distinationVC
            hotViewController.getItem("BTS")
            

        } else if segue.identifier == "new" {
            let distinationVC = segue.destination as? RecommendViewController
            newViewController = distinationVC
            newViewController.getItem("방탄소년단")
           

        } else if segue.identifier == "comment" {
            let distinationVC = segue.destination as? RecommendViewController
            commentViewController = distinationVC
            commentViewController.getItem("방탄")
            

        }
    }
    
    override func viewDidLoad() {
        self.title="BTSteam"
        
    }
    
    
}
