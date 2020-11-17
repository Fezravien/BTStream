//
//  AddFeedViewController.swift
//  BTStream
//
//  Created by 서혁규 on 2020/11/17.
//

import UIKit
import Fusuma

class AddFeedViewController: UINavigationController,FusumaDelegate {
    
    let fusuma = FusumaViewController() //이미지 선택을 위한 Fusuma컨트롤러
    var uploadController = UploadViewController() //텍스트 입력, 게시글 업로드를 위한 컨트롤러
    let storyBoard = UIStoryboard(name: "Main", bundle: nil) //Main.storyboard를 가리킴
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fusumaTintColor = UIColor.black
        fusumaBaseTintColor = UIColor.black
        fusumaBackgroundColor = UIColor.white
        
        fusuma.delegate = self
        //            fusuma.hasVideo = false
        fusuma.cropHeightRatio = 0.6 // Height-to-width ratio.
        fusuma.allowMultipleSelection = false
        //            fusuma.defaultMode = .library
        
        fusuma.hidesBottomBarWhenPushed = true
        
        uploadController = storyBoard.instantiateViewController(withIdentifier: "UploadViewController") as! UploadViewController
        uploadController.navigationItem.title = "업로드"
        
        self.pushViewController(fusuma, animated: false)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.isNavigationBarHidden = true
        self.popToViewController(fusuma, animated: false)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func fusumaImageSelected(_ image: UIImage, source: FusumaMode) {
        uploadController.image = image
        self.pushViewController(uploadController, animated: true)
        print("push")
    }
    func fusumaWillClosed() {
//        self.popToRootViewController(animated: .init())
    }
    
    // Return the image but called after is dismissed.
    func fusumaDismissedWithImage(image: UIImage, source: FusumaMode) {
    }
    
    func fusumaVideoCompleted(withFileURL fileURL: URL) {
    }
    
    // When camera roll is not authorized, this method is called.
    func fusumaCameraRollUnauthorized() {
    }
    
    // Return selected images when you allow to select multiple photos.
    func fusumaMultipleImageSelected(_ images: [UIImage], source: FusumaMode) {
    }
    
    // Return an image and the detailed information.
    func fusumaImageSelected(_ image: UIImage, source: FusumaMode, metaData: ImageMetadata) {
    }
    
    
}
