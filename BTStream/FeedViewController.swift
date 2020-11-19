//
//  FeedViewController.swift
//  BTStream
//
//  Created by 윤재웅 on 2020/10/30.
//

import UIKit

class FeedViewController: UIViewController {
    
    @IBAction func homebtn(_ sender: Any) {
        guard let hb = storyboard?.instantiateViewController(identifier: "tabBar") else {
            return
        }

        hb.modalPresentationStyle = .fullScreen

        present(hb, animated: true, completion: nil)
    }
}
