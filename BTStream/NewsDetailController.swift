//
//  NewsDetailController.swift
//  BTStream
//
//  Created by 서혁규 on 2020/11/06.
//

import UIKit
import WebKit

class NewsDetailController: UIViewController {
    
        
    @IBOutlet weak var WebView: WKWebView!
    var Url: String?
    
    
    override func viewDidLoad() {
        
        
        if let url = Url{
            if let data = try? String(contentsOf: URL(string: url)!){
//                let url = URL(string: data)
                let request = URLRequest(url: URL(string: url)!)
                WebView.load(request)
                
            }
            
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
