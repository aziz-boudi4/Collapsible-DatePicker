//
//  DatePickerViewController.swift
//  Collapsible-DatePicker
//
//  Created by aziz omar boudi  on 4/7/16.
//  Copyright © 2016 jogabo. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

  // stores DateToDisplay in the1stVC and whenLabel from segment
  var callBackDate: ((String) -> Void)?
  var callBackSegment: ((String) -> Void)?

  override func viewDidLoad() {
    super.viewDidLoad()
    datePicker.minimumDate = NSDate()

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  //MARK: -  DatePicker

  @IBOutlet weak var segmentedControl: UISegmentedControl!
  @IBOutlet weak var datePicker: UIDatePicker!
  @IBOutlet weak var viewToMove: UIView!
  lazy var displayedDateLabel: String = " "


  @IBAction func segmentedControlAction(sender: AnyObject) {
    if segmentedControl.selectedSegmentIndex == 0{
      callBackSegment?("Depart")
    } else {
      callBackSegment?("Arrive")
    }
  }

  @IBAction func getTheDate(sender: UIButton) {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "MM/dd/yyyy h:mma"
    let stringedDate = dateFormatter.stringFromDate(datePicker.date)
    callBackDate?(stringedDate)

  }

  @IBAction func getPresentDate(sender: UIButton) {
    let date = NSDate()
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "MM/dd/yyyy h:mma"
    let stringedDate = dateFormatter.stringFromDate(date)
    callBackDate?(stringedDate)

  }

    



}
