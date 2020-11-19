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
    @IBAction func homeBtn(_ sender: Any) {
        guard let tb = storyboard?.instantiateViewController(identifier: "tabBar") else {
            return
        }

        tb.modalPresentationStyle = .fullScreen

        present(tb, animated: true, completion: nil)
    }
    
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
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
            
            switch dateFormatter.string(from: date) {
            case dateFormatter.string(from: Date()):
                return "오늘"
            case "2020-11-22":
                return "출근"
            case "2020-11-23":
                return "지각"
            case "2020-11-24":
                return "결근"
            default:
                return nil
            }
        }
}

