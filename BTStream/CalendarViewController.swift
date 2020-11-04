//
//  CalendarViewController.swift
//  BTStream
//
//  Created by 윤재웅 on 2020/10/30.
//

//import UIKit
//class CalendarViewController: UIViewController {
//
//
//
//}

import UIKit
import FSCalendar

class CalendarViewController: UIViewController,FSCalendarDataSource, FSCalendarDelegate, FSCalendarDelegateAppearance{
    let dateFormatter = DateFormatter()
    @IBOutlet var calendar: FSCalendar!
    @IBOutlet weak var dateIdenfier: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        calendar.allowsMultipleSelection = true
        calendar.delegate = self
        calendar.dataSource = self
        calendar.scrollEnabled = true
        calendar.scrollDirection = .vertical
        calendar.allowsMultipleSelection = false;
        
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(dateFormatter.string(from: date) + " 선택됨")
        dateIdenfier.text=(dateFormatter.string(from: date) + " 선택됨")
    }
}

