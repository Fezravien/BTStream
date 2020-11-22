//
//  UploadViewController.swift
//  BTStream
//
//  Created by 서혁규 on 2020/11/17.
//


import UIKit
import FirebaseDatabase
import FirebaseStorage

class UploadViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var TextView: UITextView!
    
    var image = UIImage()
    let placeHolder = "하고 싶은 말이 있나요?"
    
    var ref: DatabaseReference?
    var storageRef:StorageReference?
    
    override func viewDidLoad() {
        print("upload")
        super.viewDidLoad()
        ref = Database.database().reference()   //Firebase Database 루트를 가리키는 레퍼런스
        storageRef = Storage.storage().reference()  //Firebase Storage 루트를 가리키는 레퍼런스
        
        self.TextView.delegate = self
        textViewDidEndEditing(TextView)
        let tapDismiss = UITapGestureRecognizer(target:self,action:#selector(UIInputViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tapDismiss)
//
//        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:#selector(uploadPost))
//        self.navigationItem.rightBarButtonItem = addButton
        ImageView.layer.borderWidth = 0.5

        TextView.layer.borderWidth = 0.5
        let addButton = UIButton(type: .contactAdd)
        addButton.addTarget(self, action: #selector(uploadPost), for: .touchUpInside)
        addButton.layer.position = CGPoint(x: self.view.frame.width - 50, y: 50)

        self.view.addSubview(addButton)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - TextView PlaceHolder
    func dismissKeyboard(){
        TextView.resignFirstResponder()
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if(textView.text == ""){
            textView.text = placeHolder
            textView.textColor = UIColor.lightGray
        }
        textView.resignFirstResponder()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if(textView.text == placeHolder){
            textView.text = ""
            textView.textColor = UIColor.black
        }
        textView.becomeFirstResponder()
    }
    override func viewDidAppear(_ animated: Bool) {
        self.TextView.isEditable = true
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.TextView.isEditable = false
        print("viewDidDisappear")

    }
    
    //MARK: - ImageView
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.ImageView.image = image
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        print("viewWillDisappear")

    }
    @objc func uploadPost(){
        var curRef = self.ref?.child("posts").childByAutoId()
        if self.TextView.text != placeHolder{
            curRef?.child("text").setValue(self.TextView.text)
        }else{
            curRef?.child("text").setValue("")
        }
        
        self.TextView.text = ""
        textViewDidEndEditing(TextView)
        
        let date = Date()
        let IntValueOfDate = Int(date.timeIntervalSince1970)
        curRef?.child("date").setValue("\(IntValueOfDate)")
        
        let imageRef = storageRef?.child((curRef?.key)!+".jpg")
        
        guard var uploadData = self.image.jpegData(compressionQuality: 0.1) else{
            return
        }
        imageRef?.putData(uploadData, metadata: nil, completion:{ metadata, error in
            if let error = error {
                print("putdata error")
                // 에러 발생
            } else {
                // Metadata는 size, content-type, download URL과 같은 컨텐트의 메타데이터를 가진다
            }
        })
        self.dismiss(animated: true)
//        self.navigationController?.popToRootViewController(animated: true)
    }
}
