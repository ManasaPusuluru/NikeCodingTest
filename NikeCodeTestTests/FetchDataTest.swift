//
//  FetchDataTest.swift
//  NikeSampleTests
//
//  Created by Srinivas M on 30/07/20.
//  Copyright © 2020 Manasa. All rights reserved.
//

import UIKit
import XCTest
import Foundation


class FetchDataTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFechData() {
        var albumList = [Album]()
        
        let expectation = self.expectation(description: "Loading")
        
        FetchData.shared.getData { (response) in
            if let data = response.0 {
                if let albums = data.feed?.results {
                    albumList = albums
                }
            } else if let _ = response.1 {
                XCTAssertNil(response.0)
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)

        XCTAssertEqual(true, albumList.count > 0)
    }

}
