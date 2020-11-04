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

class CalendarViewController: UIViewController,FSCalendarDataSource, FSCalendarDelegate{
    
    @IBOutlet var calendar: FSCalendar!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar.allowsMultipleSelection = true
        calendar.delegate = self
        calendar.dataSource = self
        calendar.scrollEnabled = true
        calendar.scrollDirection = .vertical


    }
}

