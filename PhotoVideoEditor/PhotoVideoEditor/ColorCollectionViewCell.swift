//
//  ColorCollectionViewCell.swift
//  Photo Editor
//
//  Created by Mohamed Hamed on 5/1/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var colorView: UIView!
   
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        colorView.layer.cornerRadius = colorView.frame.width / 2

    }
    
    
    override var isSelected: Bool {
        get {
            return super.isSelected
        }
        set {
            if newValue {
                super.isSelected = true
                self.colorView.alpha = 0.5
                
                let previouTransform =  colorView.transform
                UIView.animate(withDuration: 0.5,
                               animations: {
                                self.colorView.transform = self.colorView.transform.scaledBy(x: 1.5, y: 1.5)
                },
                               completion: { _ in
                                UIView.animate(withDuration: 0.5) {
                                    self.colorView.transform  = previouTransform
                                }
                })
                
            } else if newValue == false {
                super.isSelected = false
                self.colorView.alpha = 1.0
            }
        }
    }
    

}
