//
//  ViewExtentionsTest.swift
//  NikeSampleTests
//
//  Created by Manasa Pusuluru on 30/07/20.
//  Copyright © 2020 Manasa. All rights reserved.
//

import XCTest

class ViewExtentionsTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUIImageView() {
        let image = UIImage()
        let plaseHolderImage = UIImage(named: "ImagePlaceholder")
        let iv = UIImageView()
        iv.image = image
        
        let expectation = self.expectation(description: "Loading")
        iv.image(urlString: "https://is4-ssl.mzstatic.com/image/thumb/Music114/v4/20/fb/bd/20fbbda4-38ef-be62-a4b1-9969c9370842/634164638528.png/200x200bb.png") {
            expectation.fulfill()
        }
        
        XCTAssertEqual(true, iv.image == plaseHolderImage)
        
        waitForExpectations(timeout: 25, handler: nil)

        XCTAssertEqual(true, iv.image != image)
    }
    
    func testUILabel() {
        let lbl = UILabel.lines(3)
        XCTAssertEqual(3, lbl.numberOfLines)
    }
}
