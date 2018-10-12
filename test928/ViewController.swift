//
//  ViewController.swift
//  test928
//
//  Created by a20161104582 on 2018/9/28.
//  Copyright © 2018年 a20161104582. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    
    @IBAction func append1(_ sender: UIButton) {
        let title = sender.currentTitle!
        if(hasNumber){
            lb1.text = lb1.text! + title
        }else{
            lb1.text = title
            hasNumber = true
        }
    }
    
    @IBAction func remove(_ sender: Any) {
        lb1.text?.removeLast()
    }
    @IBAction func AC(_ sender: Any) {
        lb1.text = " "
    }
    @IBAction func operate(_ sender: UIButton) {
        let operate = sender.currentTitle
        if hasNumber{
            enter()
        }
        switch operate{
            case "+":preforeOperation{$0 + $1}
            case "-":preforeOperation{$0 - $1}
            case "*":preforeOperation{$0 * $1}
            case "/":preforeOperation{$0 / $1}
        default:break
        }
    }
    
    func preforeOperation(operation:(Double,Double)->Double){
        if(operaStack.count >= 2){
            displayValue = operation(operaStack.removeLast(),operaStack.removeLast())
            enter()
        }
    }
    
    @IBOutlet weak var lb1: UILabel!
    var hasNumber:Bool = false
    
    var operaStack = Array<Double>()
    @IBAction func enter() {
        hasNumber = false
        operaStack.append(displayValue)
        print("operaStack = \(operaStack)")
    }
    
    var displayValue:Double{
        get{
            return (lb1.text! as NSString).doubleValue
        }
        set{
            lb1.text = "\(newValue)"
            hasNumber = false
        }
    }
   
    
    /*override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }*/


}

