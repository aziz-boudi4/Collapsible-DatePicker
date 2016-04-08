//
//  ViewController.swift
//  Collapsible-DatePicker
//
//  Created by aziz omar boudi  on 4/7/16.
//  Copyright © 2016 jogabo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableTest: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("datePickerCell", forIndexPath: indexPath)

    return cell
  }

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

    let cell = tableView.cellForRowAtIndexPath(indexPath)

    defer {tableView.deselectRowAtIndexPath(indexPath, animated: false)}
    guard let controller = storyboard?.instantiateViewControllerWithIdentifier("DatePickerViewController") as? DatePickerViewController else { return }

    controller.callBackDate = {(displayedDateLabel) in
      cell?.detailTextLabel?.text = displayedDateLabel
     }

    controller.callBackSegment = { (segmentLabel) in
      cell?.textLabel?.text = segmentLabel
    }

    controller.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
    navigationController?.presentViewController(controller, animated: true, completion: nil)
    }


  @IBAction func unwindToVC(segue: UIStoryboardSegue) {
    
  }




}


