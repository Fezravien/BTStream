import UIKit

class RecommendViewController: UIViewController {
    @IBOutlet weak var recommendTitle: UILabel!
    var url:URL!
    var data:Data!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        url = URL(string: "https://img.youtube.com/vi/gdZLi9oWNZg/mqdefault.jpg")
        data = try? Data(contentsOf: url!)

    }
}

extension RecommendViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendCell", for: indexPath) as? RecommendCell else {
            return UICollectionViewCell()
        }
        
        cell.thumbnail.image = UIImage(data: data!)
        
        return cell
    }
    
}

extension RecommendViewController:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let player = storyboard?.instantiateViewController(identifier: "player") else {
            return
        }
        

        present(player, animated: true, completion: nil)
    }
}

extension RecommendViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 40)
    }
}



