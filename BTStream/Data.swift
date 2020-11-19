//
//  Data.swift
//  BTStream
//
//  Created by 서혁규 on 2020/11/17.
//

import Foundation
import UIKit

let g_NumPerOneLoad = 3 //한 Load에 불러올 게시글의 수
class Post {
    var text:String //게시글의 내용
    var date:Int    //게시 시간
    var imageView = UIImageView()   //게시 이미지
    
    init(_ text:String, _ date:Int) {
        self.text = text
        self.date = date
    }
}
