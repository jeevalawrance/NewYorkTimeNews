//
//  NYWebserviceTests.swift
//  NYNewsTimesTests
//
//  Created by Apple on 18/12/20.
//

import XCTest
@testable import NYNewsTimes

class NYWebserviceTests: XCTestCase {

    let nYMostPopularViewModel =  NYMostPopularViewModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNYPopularNews() throws {
        var successBool = false
        let promise = expectation(description: "mostPopularNewsApi")

        nYMostPopularViewModel.apiManager.getRequest(section: "all-sections", period: 7) { response,status  in
            if status
            {
                if let responseNews = response?.results{
                    
                    if responseNews.count > 0 {
                        successBool = true
                    }
                }
            }
            else{
            }
            promise.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertTrue(successBool, "There should be a sucess")

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
