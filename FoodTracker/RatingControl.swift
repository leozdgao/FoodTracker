//
//  RatingControl.swift
//  FoodTracker
//
//  Created by 高振东 on 15/12/22.
//  Copyright © 2015年 高振东. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK: Properties
    
    var rating = 0 {
        didSet {
            self.setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    
    let stars = 5
    let spacing = 5
    
    
    // MARK: Init
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        // 创建5个按钮
        for _ in 0..<self.stars {
            let button = UIButton()
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            
            button.adjustsImageWhenHighlighted = false
            
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            
            self.addSubview(button)
            self.ratingButtons += [button]
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(self.frame.size.height)
        let width = (buttonSize + self.spacing) * self.stars
        
        return CGSize(width: width, height: buttonSize)
    }
    
    override func layoutSubviews() {
        let buttonSize = Int(self.frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        for (index, button) in self.ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + self.spacing))
            button.frame = buttonFrame
        }
        
        self.updateButtonSelectionStates()
    }
    
    // MARK: Button Action
    
    func ratingButtonTapped(button: UIButton) {
        self.rating = self.ratingButtons.indexOf(button)! + 1
        
        // 更新按钮的状态
        self.updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for (index, button) in self.ratingButtons.enumerate() {
            button.selected = index < self.rating
        }
    }
}
