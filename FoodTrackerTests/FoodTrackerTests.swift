//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by 高振东 on 15/12/21.
//  Copyright © 2015年 高振东. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    // MARK: FoodTracker Tests
    
    // 测试Meal的初始化
    func testMealInitializtion () {
        // 成功创建
        let potentialItem = Meal(name: "Newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        // 创建失败
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName)
    }
    
}
