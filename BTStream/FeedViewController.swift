//
//  FeedViewController.swift
//  BTStream
//
//  Created by 윤재웅 on 2020/10/30.
//

import UIKit

class FeedViewController: UIViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineCell", for: indexPath) as! FeedViewCell                          //TimelineCell ID에 해당하는 TableViewCell을 얻어오고 TimelineTableViewCell로 캐스팅한다. 이를 cell에 할당한다.
        let post = posts[indexPath.row]
        cell.TextLabel.text = post.text
        cell.ImageView.image = post.imageView.image
        
        return cell
    }
    
    // MARK: -  Load posts
    func loadPosts(){
        var orderedQuery:DatabaseQuery?
        orderedQuery = ref?.child("posts").queryOrdered(byChild: "date")   //"date"기준으로 정렬된 posts를 얻는 질의를 작성
        
        orderedQuery?.observeSingleEvent(of: .value, with: { (snapshot) in  //이 line이 호출되는 시점에 snapshot을 얻어온다.
            var snapshotData = snapshot.children.allObjects //"DataSnapshot"타입에서 [Any] 데이터를 얻어옴
            snapshotData = snapshotData.reversed()  //오름차순을 내림차순으로 바꿈
            
            for anyDatum in snapshotData{   //snapshotData의 각각의 원소를 알맞게 처리
                let snapshotDatum = anyDatum as! DataSnapshot                                                                                                           // Any타입으로 변형된 DataSnapshot을 다시 DataSnapshot타입으로 변형, 여기서 snapshotDatum은 한 post를 담고 있다
                let dicDatum = snapshotDatum.value as! [String:String]  //post의 value, 즉 [text:~~, date:~~]를 얻어옴
                if let text = dicDatum["text"],
                    let date = Int(dicDatum["date"]!){
                    let post = Post(text,date)  //얻어온 데이터로 부터 Post생성
                    
                    //Get Image
                    let imageRef = self.storageRef?.child("\(snapshotDatum.key).jpg")   //앞에서 저장한 파일이름을 그대로 참조한다.
                    post.imageView.sd_setImage(with: imageRef!, placeholderImage: UIImage(), completion:{(image,error,cacheType,imageURL) in self.tableView.reloadData() })                                                                                                         //설정한 참조로 부터 이미지를 읽어온다. placeholderImage는 다운로드가 완료되기 전에 표시될 이미지. 이미지를 다 불러왔다면 Tableview를 갱신한다.
                        
                    self.loadedPosts += [post]  //앞에서 Firebase로부터 얻어온 데이터를 post에 모두 옮겼고, 이를 loadedPosts에 저장
                }
            }
                                                            
            self.posts += self.loadedPosts.prefix(g_NumPerOneLoad)  //loadedPosts에서 일부만 posts에 저장
            self.tableView.reloadData() //posts가 변하였으므로 tableView를 reload
        })
    }
    
    func loadFreshPosts(){
        var filteredQuery:DatabaseQuery?
        if let latestDate = self.posts.first?.date{ // posts의 first, 즉 첫 번째 게시글이 존재할 경우
            filteredQuery = ref?.child("posts").queryOrdered(byChild: "date").queryStarting(atValue: "\(latestDate + 1)")
            //첫 번째 게시글보다 date숫자가 큰 posts들만 얻어오는 질의를 작성한다.
        }else{  //첫번째 게시글이 없을 경우
            filteredQuery = ref?.child("posts").queryOrdered(byChild: "date").queryStarting(atValue: "\(0)")
            //모든 posts들을 얻어오는 질의를 작성한다.
        }
        
        filteredQuery?.observeSingleEvent(of: .value, with: { (snapshot) in
            var snapshotData = snapshot.children.allObjects
            snapshotData = snapshotData.reversed()
            
            var freshPostsChunk = [Post]()
            
            for anyDatum in snapshotData{
                let snapshotDatum = anyDatum as! DataSnapshot
                let dicDatum = snapshotDatum.value as! [String:String]
                if let text = dicDatum["text"],
                    let date = Int(dicDatum["date"]!){
                    let post = Post(text,date)
                    
                    //Get Image from URL
                    let imageRef = self.storageRef?.child("\(snapshotDatum.key).jpg")
                    post.imageView.sd_setImage(with: imageRef!, placeholderImage: UIImage(), completion:{(image,error,cacheType,imageURL) in self.tableView.reloadData() })                                                                                                         //설정한 참조로 부터 이미지를 읽어온다. placeholderImage는 다운로드가 완료되기 전에 표시될 이미지
                    
                    freshPostsChunk += [post]
                        
                }
            }
            self.loadedPosts.insert(contentsOf: freshPostsChunk, at: 0)
            self.posts.insert(contentsOf: freshPostsChunk, at: 0)
            self.tableView.reloadData()
        })
    }
    func loadPastPosts(){
        let pastPosts = self.loadedPosts.filter{$0.date < (self.posts.last?.date)!}
        let pastChunkPosts = pastPosts.prefix(g_NumPerOneLoad)
        
        if pastChunkPosts.count > 0{
            self.posts += pastChunkPosts
            sleep(1)
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Reload Posts
    @objc func refresh(){
        print("refresh")
        self.loadFreshPosts()
        self.refreshControl?.endRefreshing()
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let  height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height + self.FooterLabel.frame.height - contentYoffset
        if distanceFromBottom < height {
            print(" you reached end of the table")
            loadPastPosts()
        }
    @IBAction func homebtn(_ sender: Any) {
        guard let hb = storyboard?.instantiateViewController(identifier: "tabBar") else {
            return
        }

        hb.modalPresentationStyle = .fullScreen

        present(hb, animated: true, completion: nil)
    }
}
