//
//  NYNewsTimesTests.swift
//  NYNewsTimesTests
//
//  Created by Jeeva on 16/12/20.
//

import XCTest
@testable import NYNewsTimes

class NYNewsTimesTests: XCTestCase {

    var storyboard : UIStoryboard?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        XCTAssertNotNil(self.storyboard)
    }

    func testMasterViewController() {
        
        let masterScreen = self.storyboard?.instantiateViewController(withIdentifier: "MasterViewController")
        
        XCTAssertNotNil(masterScreen)
        XCTAssertTrue(masterScreen is ViewController)
        
    }
    
    func testDetailView() {
        
        let detailScreen = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController")
        
        XCTAssertNotNil(detailScreen)
        XCTAssertTrue(detailScreen is DetailViewController)
    }
    
    func testApiKey() {
        let key = Constants.API_KEY
        XCTAssert(key == "SMmkaVjHGApXZYvhlujmmhCrElfGmsDM", "Api key is valid")
    }

}
