import UIKit

class MembersPlayerViewController: UIViewController {
    
    var url:URL!
    var data:Data!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        url = URL(string: "https://img.youtube.com/vi/gdZLi9oWNZg/hqdefault.jpg")
        //sddefault.jpg
        data = try? Data(contentsOf: url!)
    }
    
    
}
extension MembersPlayerViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "memCell") as? memCell else {
            return UITableViewCell()
        }
        cell.memimg.image = UIImage(data: data!)
        
        return cell
    }
    
}

extension MembersPlayerViewController: UITableViewDelegate{
    
}

class memCell:UITableViewCell {

    @IBOutlet weak var memimg: UIImageView!
    
}
