//
//  Table_Test_CaseTests.swift
//  Table_Test_CaseTests
//
//  Created by Lokeshwaran on 12/08/24.
//

import XCTest
@testable import Table_Test_Case

final class Table_Test_CaseTests: XCTestCase {

    var vc : ViewController!
    var tb : UITableView!
    
    override func setUpWithError() throws
    {
        super.setUp()
  
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        vc.loadViewIfNeeded()
        
        tb = vc.tableView
        
    }
    
    override func tearDownWithError() throws
    {
        vc = nil
        tb = nil
        super.tearDown()
    }
    
    func testViewDidLoad()
    {
        

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        
        vc.loadViewIfNeeded()

    }
    
    func testCheckCount()
    {

        if vc.tableData.count == 12
        {
            print("XCTest :- Pass")
        }
        else
        {
            print("XCTest :- Fail")
        }
        
    }
    
    func testNoOfRows()
    {
        let noOfRows = vc.tableView(tb, numberOfRowsInSection: 0)
        
        XCTAssertEqual(noOfRows, 10,"Count mismatched")
    }
    
    func testHeight()
    {
    
        let indexPath = IndexPath(row: 0, section: 0)
        
        let rowHt = vc.tableView(tb,heightForRowAt: indexPath)
        
        XCTAssertEqual(rowHt,100,"ht should be 100")

    }
    
    func testCellForRowAt() throws 
    {

         let indexPath = IndexPath(row: 0, section: 0)
        
         let cell = vc.tableView(tb, cellForRowAt: indexPath)
        
        print("cell lbl -->",cell.textLabel?.text)
        print("cell count -->", vc.tableData[indexPath.row].count)
        XCTAssertEqual(cell.textLabel?.text, vc.tableData[indexPath.row], "Cell text should match the corresponding item in tableData")
        
     }
  

}
