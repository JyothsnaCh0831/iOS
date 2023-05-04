//
//  ViewController.swift
//  ChaparalaJListApp
//
//  Created by Chaparala,Jyothsna on 3/2/23.
//

import UIKit

class ListVC: UIViewController {
    
    var items : [String] = []
    var count : Int = 0
    
    let defaultText = "Please enter the item name and quantity, and click on the plus sign to add the item to the grocery list."

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.listTV.text = defaultText
        
        if(self.listTV.text == defaultText) {
            self.itemNumTF.isEnabled = false
        } else {
            self.itemNumTF.isEnabled = true
        }
        
        self.itemQuantityTF.isEnabled = false
        
    }
    @IBOutlet weak var listIMG: UIImageView! {
        didSet {
            self.setAttributes(for: self.listIMG)
        }
    }
    
    
    @IBOutlet weak var itemTF: UITextField!
    
    @IBAction func itemTF(_ sender: UITextField) {
        self.itemQuantityTF.isEnabled = true
    }
    
    @IBOutlet weak var itemQuantityTF: UITextField!
    
    @IBOutlet weak var itemNumTF: UITextField!
    
    @IBOutlet weak var listTV: UITextView!
    
    @IBOutlet weak var addBTN: UIButton! {
        didSet {
            self.setBorder(for: self.addBTN)
        }
    }
    
    @IBOutlet weak var deleteBTN: UIButton! {
        didSet {
            self.setBorder(for: self.deleteBTN)
        }
    }
    
    @IBOutlet weak var clearBTN: UIButton! {
        didSet {
            self.setBorder(for: self.clearBTN)
        }
    }
    
    @IBAction func addToList(_ sender: UIButton) {
        guard let item = self.itemTF, let itemName = item.text else {
            return
        }
        guard let itemNum = self.itemQuantityTF, let quantity = itemNum.text else {
            return
        }
        
        
        items.append(itemName + " - " + quantity)
        count += 1
        
        if self.listTV?.text == defaultText {
            self.listTV.text = """
                                List of grocery items:

                                """
        }
        
        self.listTV.text += "\n" + String(count)
        self.listTV.text += ". "
        self.listTV.text += items[count-1]
        
        self.itemQuantityTF.text = ""
        self.itemTF.text = ""
        
        self.itemQuantityTF.isEnabled = false
        self.itemNumTF.isEnabled = true
    }
    
    @IBAction func deleteFromList(_ sender: UIButton) {
        guard let itemNumber = self.itemNumTF, let number = itemNumber.text, let num = Int(number) else {
            return
        }
        
        items.remove(at: (num-1))
        count -= 1
        
        if items.count == 0 {
            self.listTV.text = defaultText
        } else {
            self.listTV.text = """
                                List of grocery items:

                                """
            for i in 0..<items.count {
                self.listTV.text += "\n" + String((i+1))
                self.listTV.text += ". "
                self.listTV.text += items[i]
            }
        }
        self.itemNumTF.text = ""
        
        if(self.listTV.text == defaultText) {
            self.itemNumTF.isEnabled = false
        }
        
    }
    
    @IBAction func clear(_ sender: UIButton) {
        self.listTV.text = "Please enter the item name and quantity, and click on the plus sign to add the item to the grocery list."
        count = 0
        items.removeAll()
        if(self.listTV.text == defaultText) {
            self.itemNumTF.isEnabled = false
        }
    }
    
    private func setAttributes(for view: UIView) {
        view.layer.cornerRadius = 10.0
        view.layer.masksToBounds = true
    }
    
    private func setBorder(for view: UIView) {
        view.layer.borderWidth = 0.25
        view.layer.cornerRadius = 10.0
        view.layer.masksToBounds = true
    }
}

