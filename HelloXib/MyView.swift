//
//  MyView.swift
//  HelloXib
//
//  Created by MBP_JackYang on 2019/11/30.
//  Copyright © 2019 MBP_JackYang. All rights reserved.
//

import UIKit

class MyView: UIView {

   var view:UIView!
    var whenValueChange:((Double)->())? = nil
    
    
   override init(frame: CGRect) {
       super.init(frame: frame)
       setup()
   }
   required init?(coder aDecoder: NSCoder) { //一定要寫的建構器
       super.init(coder: aDecoder)
       setup()
   }
   func setup() {
       view = loadViewFromNib()
       view.frame = bounds
       view.autoresizingMask = [ UIView.AutoresizingMask.flexibleWidth,
           UIView.AutoresizingMask.flexibleHeight ]
       addSubview(view)
   }


   func loadViewFromNib() -> UIView {
       let nib = UINib(nibName: "MyView", bundle: nil )
       let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
       return view
   }

    @IBAction func valueChanged(_ sender: Any) {
    }
    
    @IBAction func print(_ sender: UISlider) {
         whenValueChange?(Double(sender.value))
    }
}
