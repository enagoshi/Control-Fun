//
//  ViewController.swift
//  Control Fun
//
//  Created by enagoshi on 3/17/15.
//  Copyright (c) 2015 Iolani School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var doSomethingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //sets slider label before user even touches the slider
        sliderLabel.text="50"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //tells textfield to give up control of the keyboard so that it will disappear off screen when user is done typing.
    @IBAction func textFieldDoneEditing(sender: UITextField){
        sender.resignFirstResponder()
    }
    
    //makes the keyboard disappear if user taps in the background
    @IBAction func backgroundTap(sender: UIControl){
        nameField.resignFirstResponder()
        numberField.resignFirstResponder()
    }
    
    @IBAction func sliderChanged(sender: UISlider) {
        let progress = lroundf(sender.value)
        sliderLabel.text="\(progress)"
    }
    
    @IBAction func switchChanged(sender: UISwitch) {
        let setting = sender.on
        leftSwitch.setOn(setting, animated: true)
        rightSwitch.setOn(setting, animated: true)
    }
    
    @IBAction func toggleControls(sender: UISegmentedControl) {
        //index 0 is the switches; index 1 is the button
        if sender.selectedSegmentIndex == 0{
            leftSwitch.hidden = false
            rightSwitch.hidden = false
            doSomethingButton.hidden = true
        }
        else{
            leftSwitch.hidden = true
            rightSwitch.hidden = true
            doSomethingButton.hidden = false
        }
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        //create a controller to display an action sheet or an alert
        let controller = UIAlertController(title: "Are You Sure?", message: nil, preferredStyle: .ActionSheet)
        let yesAction = UIAlertAction(title: "Yes, I'm sure!", style: .Destructive, handler: { action in let msg = self.nameField.text.isEmpty ? "You can breathe easy, everything went OK." : "You can breathe easy, \(self.nameField.text)," + "everything went OK."
            let controller2 = UIAlertController(title: "Something Was Done", message: msg, preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Phew!", style: .Cancel, handler: nil)
            controller2.addAction(cancelAction)
            self.presentViewController(controller2, animated: true, completion: nil)
        })
        let noAction = UIAlertAction(title: "No Way!", style: .Cancel, handler: nil)
        controller.addAction(yesAction)
        controller.addAction(noAction)
        if let ppc = controller.popoverPresentationController{
            ppc.sourceView=sender
            ppc.sourceRect = sender.bounds
        }
        presentViewController(controller, animated: true, completion: nil)
    }
    
}

