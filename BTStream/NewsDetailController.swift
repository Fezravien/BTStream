//
//  NewsDetailController.swift
//  BTStream
//
//  Created by 서혁규 on 2020/11/06.
//

import UIKit

class NewsDetailController: UIViewController {
    
    @IBOutlet weak var LabelMain: UILabel!
    @IBOutlet weak var ImageMain: UIImageView!
    
    
    var imageUrl: String?
    var desc: String?
    
    
    override func viewDidLoad() {
        
        
        if let img = imageUrl{
            if let data = try? Data(contentsOf: URL(string: img)!){
                DispatchQueue.main.async{
                    self.ImageMain.image = UIImage(data: data)
                    
                }
                
            }
            
        }
        
        if let des = desc{
            self.LabelMain.text = des 
            
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
