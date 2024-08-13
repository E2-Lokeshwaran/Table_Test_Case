//
//  Table_Test_CaseUITests.swift
//  Table_Test_CaseUITests
//
//  Created by Lokeshwaran on 12/08/24.
//

import XCTest

final class Table_Test_CaseUITests: XCTestCase 
{

    var app: XCUIApplication!
    
    override func setUpWithError() throws
    {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws 
    {

    }
    
    
    func testTableViewExists()
    {
        let tableView = app.tables.element(boundBy: 0)
        XCTAssertTrue(tableView.exists,"Table view should exists")
    }
    
    func testTableViewCellCount()
    {
        let tableView = app.tables.element(boundBy: 0)
        let cellCount = tableView.cells.count
        XCTAssertEqual(cellCount, 10,"Table should have 10 cell")
        
    }
    
    func testTableViewCellContent() 
    {
        let tableView = app.tables.element(boundBy: 0)
        for i in 1...10 
        {
            let cellQuery = tableView.cells.containing(NSPredicate(format: "label CONTAINS[c] %@", "\(i)"))
            XCTAssertTrue(cellQuery.element.exists, "Cell with text '\(i)' should exist")
        }
    }
    
//    func testTableViewScrolling()
//    {
//        let tableView = app.tables.element(boundBy: 0)
//        let lastCellPredicate = NSPredicate(format: "label CONTAINS[c] '10'")
//        let lastCell = tableView.cells.matching(lastCellPredicate).firstMatch
//        
//        if !lastCell.isHittable 
//        {
//            tableView.swipeUp()
//        }
//        
//        XCTAssertTrue(lastCell.isHittable, "Last cell should be visible after scrolling")
//    }
    
//    func testTableViewScrolling()
//    {
//        let tableView = app.tables.element(boundBy: 0)
//        let lastCellPredicate = NSPredicate(format: "label CONTAINS[c] '10'")
//        let lastCell = tableView.cells.matching(lastCellPredicate).firstMatch
//        
//        // Scroll until the last cell is hittable or we've swiped a maximum number of times
//        let maxSwipes = 5
//        var swipeCount = 0
//        while !lastCell.isHittable && swipeCount < maxSwipes
//        {
//            tableView.swipeUp()
//            swipeCount += 1
//        }
//        
//        XCTAssertTrue(lastCell.isHittable, "Last cell should be visible after scrolling \(swipeCount) times")
//        
//        // Additional check to verify the content of the last cell
//        XCTAssertEqual(lastCell.label, "10", "The last cell should contain '10'")
//    }
    
}


