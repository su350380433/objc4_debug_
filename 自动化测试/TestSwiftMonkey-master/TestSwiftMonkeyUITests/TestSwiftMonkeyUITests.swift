//
//  TestSwiftMonkeyUITests.swift
//  TestSwiftMonkeyUITests
//
//  Created by Wojciech Czerski on 02.02.19.
//  Copyright © 2019 Wojciech Czerski. All rights reserved.
//

import XCTest
import SwiftMonkey

class TestSwiftMonkeyUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let application = XCUIApplication()
        _ = application.descendants(matching: .any).element(boundBy: 0).frame
        let monkey = Monkey(frame: application.frame)
        
//        let element = XCUIApplication().windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
//        element.swipeUp()
//        element/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeUp()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        element/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeUp()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        element/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeUp()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        element.swipeUp()
//        element.swipeUp()
//        element.swipeUp()
//        element/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeUp()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        monkey.addDefaultXCTestPublicActions(app: application)
        monkey.addXCTestTapAlertAction(interval: 100, application: application)
        monkey.monkeyAround()
    }

}
