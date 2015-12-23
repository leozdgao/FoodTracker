//
//  Meal.swift
//  FoodTracker
//
//  Created by 高振东 on 15/12/23.
//  Copyright © 2015年 高振东. All rights reserved.
//

import UIKit

class Meal {
    
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Init
    
    init?(name:String, photo: UIImage?, rating: Int) {
        // 初始化属性
        self.name = name
        self.photo = photo
        self.rating = rating
        
        // 检验属性值
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
    
}
