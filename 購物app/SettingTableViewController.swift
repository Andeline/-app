//
//  SettingTableViewController.swift
//  購物app
//
//  Created by 蔡佳穎 on 2021/4/22.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    @IBOutlet weak var pinkBagStepper: UIStepper!
    @IBOutlet weak var blackBagStepper: UIStepper!
    @IBOutlet weak var brownBagStepper: UIStepper!
    
    @IBOutlet weak var pinkBagQtyLabel: UILabel!
    @IBOutlet weak var blackBagQtyLabel: UILabel!
    @IBOutlet weak var brownBagQtyLabel: UILabel!
    
    @IBOutlet weak var pricePinkBagLabel: UILabel!
    @IBOutlet weak var priceBlackBagLabel: UILabel!
    @IBOutlet weak var priceBrownBagLabel: UILabel!
    
    @IBOutlet weak var priceTotalLabel: UILabel!
    
    @IBOutlet weak var shoppingCartClearButton: UIButton!
    
    //定義商品數量初始值=0
    var itemPinkBag: Int = 0
    var itemBlackBag: Int = 0
    var itemBrownBag: Int = 0
    var priceMiniBag: Int = 3690
    
    //商品總額運算
    func totalCalculate() {
        let sum = itemPinkBag*priceMiniBag + itemBlackBag*priceMiniBag + itemBrownBag*priceMiniBag
        priceTotalLabel.text = "TOTAL : \(sum)"
        priceTotalLabel.sizeToFit()
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //方便改變商品價格
        pricePinkBagLabel.text = "NT$\(priceMiniBag)"
        priceBlackBagLabel.text = "NT$\(priceMiniBag)"
        priceBrownBagLabel.text = "NT$\(priceMiniBag)"
        priceTotalLabel.text = "TOTAL : "
        
        //使Label外框隨內容調整
        pricePinkBagLabel.sizeToFit()
        priceBlackBagLabel.sizeToFit()
        priceBrownBagLabel.sizeToFit()
        priceTotalLabel.sizeToFit()
        
        
        //Clear Button圓角
        shoppingCartClearButton.layer.cornerRadius = 7
        shoppingCartClearButton.clipsToBounds = true
    }

    // MARK: - Table view data source
    
    @IBAction func changeQty(_ sender: UIStepper) {
        
        //取得stepper的值
        itemPinkBag = Int(pinkBagStepper.value)
        itemBlackBag = Int(blackBagStepper.value)
        itemBrownBag = Int(brownBagStepper.value)
        
        //顯示於QTYLabel
        pinkBagQtyLabel.text = "QTY : \(itemPinkBag)"
        blackBagQtyLabel.text = "QTY : \(itemBlackBag)"
        brownBagQtyLabel.text = "QTY : \(itemBrownBag)"
        
        //計算總額
        totalCalculate()
    }
    
    @IBAction func clear(_ sender: UIButton) {
        
        //stepper歸零
        pinkBagStepper.value = 0
        blackBagStepper.value = 0
        brownBagStepper.value = 0
        
        //取得stepper的值
        itemPinkBag = Int(pinkBagStepper.value)
        itemBlackBag = Int(blackBagStepper.value)
        itemBrownBag = Int(brownBagStepper.value)
        
        //顯示於QTYLabel
        pinkBagQtyLabel.text = "QTY : \(itemPinkBag)"
        blackBagQtyLabel.text = "QTY : \(itemBlackBag)"
        brownBagQtyLabel.text = "QTY : \(itemBrownBag)"
        
        //計算總額
        totalCalculate()
    }
}
