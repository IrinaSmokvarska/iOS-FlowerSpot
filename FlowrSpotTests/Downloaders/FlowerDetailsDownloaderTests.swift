//
//  FlowerDetailsDownloaderTests.swift
//  FlowrSpotTests
//
//  Created by Irina Smokvarska on 6/23/20.
//  Copyright © 2020 PovioLabs. All rights reserved.
//

import XCTest
@testable import FlowrSpot

class FlowerDetailsDownloaderTests: XCTestCase {
  private let flowersDownloader = SightingsDownloader()
  
  func testFetchFlowersList() {
    let promise = expectation(description: "Completion handler invoked")
    
    flowersDownloader.fetchSighingList(flowerId: 2, success: { (response) in
        XCTAssertNotNil(response)
        promise.fulfill()
    }, failure: { (error) in
        XCTFail("Request should succeed")
        promise.fulfill()
    })
    
    waitForExpectations(timeout: 5, handler: nil)
  }
}
