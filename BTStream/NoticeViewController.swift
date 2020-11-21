//
//  NoticeViewController.swift
//  BTStream
//
//  Created by 서혁규 on 2020/11/21.
//

import UIKit

class NoticeViewController:  UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    var strArray = [ "20/11/21", "20/10/22", "20/10/03", "20/09/23", "20/09/14", "20/09/02", "20/08/13", "20/08/03", "20/07/22", "20/07/15", "20/07/02" ];
    var strArrayLa = ["날씨는 변덕이지만 한결같이 찾아온 9.1.2 업데이트 안내","카카오톡 운영정책 변경 안내","사회적 거리두기 1단계와 함께 찾아온 9.0.6 업데이트","IOS 11.4 이하 버전 지원 종료 안내","계속되는 비로 꿉꿉해진 기분 상쾌하게 만들어 줄 9.0.0 업데이트 안내","중복 맞이 삼계탕보다 더 좋은 8.9.6 버전 업데이트 공지","수박 먹으면서 쓰는 8.9.1 버전 업데이트 안내","앗! 할 사이에 찾아온 여름처럼 휘리릭 찾아온 8.8.5 버전 업데이트 안내","나만 몰랐던 앱 1500% 활용하는 방법! 여기저기 눌러보세요!"," BTS 팬들을 위한 앱 "]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCell(withIdentifier: "Type2", for: indexPath) as! Type2
        cell.TextLabel.text = "\(strArrayLa[indexPath.row])"
        cell.DateLabel.text = "\(strArray[indexPath.row])"

        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
          print("clicked : \(indexPath.row)")
      }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableview.delegate = self
        tableview.dataSource = self


    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
