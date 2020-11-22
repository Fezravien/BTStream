import UIKit

class MembersViewController: UIViewController {
    
    let members = ["RM", "Jin", "SUGA", "J-hope", "Jimin", "V", "Jungkuk"]
    var member:MembersPlayerViewController!
    
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
        // 저장된 이미지 출력
        cell.img.image = UIImage(named: members[indexPath.row])
        
        // cell 모양 원형으로
        cell.img.layer.cornerRadius = cell.img.frame.size.height/2
        cell.img.layer.masksToBounds = true
        cell.img.layer.borderWidth = 0
        
        return cell
        
    }
    
}

extension MembersViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mem = members[indexPath.item]
        
        guard let mb = storyboard?.instantiateViewController(identifier: "memberPlayer") as? MembersPlayerViewController else {
            return
        }
        mb.param = mem
        present(mb, animated: true, completion: nil)
    }
    
    
}

extension MembersViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}
