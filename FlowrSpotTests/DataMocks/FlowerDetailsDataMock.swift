//
//  FlowerDetailsDataMock.swift
//  FlowrSpotTests
//
//  Created by Irina Smokvarska on 6/23/20.
//  Copyright © 2020 PovioLabs. All rights reserved.
//

import XCTest
@testable import FlowrSpot

class FlowersDetailsDataMock {
  let decoder = JSONDecoder()
  
  init() {
    decoder.keyDecodingStrategy = .convertFromSnakeCase
  }
  
  func mockSightingEntity() -> [Sighting] {
    return testMockSightingsResponses()
  }
  
  func testMockSightingsResponses() -> [Sighting] {
    do {
      let json = try loadJsonFromFile("sightings")
      let data = try JSONSerialization.data(withJSONObject: json, options: [])
      let container = try decoder.decode([Sighting].self, from: data)
      return container
    } catch {
      print(error.localizedDescription)
    }
    return [Sighting]()
  }
}

private extension FlowersDetailsDataMock {
  func loadJsonFromFile(_ file: String) throws -> Any {
    guard let path = Bundle(for: type(of: self)).path(forResource: file, ofType: "json") else { throw RemoteResourceError.generic }
    
    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
    return jsonResult
  }
}
