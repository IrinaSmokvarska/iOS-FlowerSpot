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
  private let sightings = FlowersDetailsDataMock.mockSightingEntity()
  private let dataSource = FlowerDetailsDataSource()
  
  func testDataSource() {
    dataSource.update(sightings: sightings)
    
    XCTAssertTrue(dataSource.sections.count == 1)
    XCTAssertTrue(dataSource.sections.first?.rows.count == sightings.count)
    
    for i in 0..<sightings.count {
      let row = dataSource.row(at: IndexPath(row: i, section: 0))
      XCTAssertNotNil(row)
      
      if let row = row {
        switch row {
        case let .sighting(entity):
          XCTAssertEqual(sightings[i].name, entity.name)
        }
      }
    }
  }
}

