import UIKit

class MembersViewController: UIViewController {
    
    let members = ["RM", "Jin", "SUGA", "J-hope", "Jimin", "V", "Jungkuk"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
}

extension MembersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.members.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MembersCell", for: indexPath) as? MembersCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .red
        return cell
        
    }
    
    
}

extension MembersViewController: UICollectionViewDelegate {
    
}
