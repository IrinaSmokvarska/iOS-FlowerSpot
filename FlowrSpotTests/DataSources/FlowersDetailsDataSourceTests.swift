//
//  FlowersDetailsDataSourceTests.swift
//  FlowrSpotTests
//
//  Created by Irina Smokvarska on 6/23/20.
//  Copyright © 2020 PovioLabs. All rights reserved.
//

import XCTest
@testable import FlowrSpot

class FlowersDetailsDataSourceTests: XCTestCase {
  private let flowers = FlowersDataMock().mockFlowerEntities()
  private let dataSource = FlowersDataSource()
  
  func testDataSource() {
    dataSource.update(flowers: flowers)
    
    XCTAssertTrue(dataSource.sections.count == 1)
    XCTAssertTrue(dataSource.sections.first?.rows.count == flowers.count)
    
    for i in 0..<flowers.count {
      let row = dataSource.row(at: IndexPath(row: i, section: 0))
      XCTAssertNotNil(row)
      
      if let row = row {
        switch row {
        case let .flower(entity):
          XCTAssertEqual(flowers[i].name, entity.name)
        }
      }
    }
  }
}

