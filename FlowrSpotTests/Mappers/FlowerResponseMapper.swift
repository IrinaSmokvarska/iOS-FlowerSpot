//
//  FlowerResponseMapper.swift
//  FlowrSpotTests
//
//  Created by Irina Smokvarska on 6/23/20.
//  Copyright © 2020 PovioLabs. All rights reserved.
//

import XCTest
@testable import FlowrSpot

class FlowerResponseMapper: XCTestCase {

    public func map(response: [FlowerResponse]) -> [Flower]{
        var arr = [Flower]()
        for res in response {
            arr.append(res.flower!)
        }
        return arr
    }
    
}
