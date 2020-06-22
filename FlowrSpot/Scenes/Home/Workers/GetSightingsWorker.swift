//
//  GetSightingsWorker.swift
//  FlowrSpot
//
//  Created by Irina Smokvarska on 6/23/20.
//  Copyright © 2020 PovioLabs. All rights reserved.
//

import Foundation

class GetSightingsWorker {
  var downloader = SightingsDownloader()
  
  func execute(flowerId: Int, success: RestClient.SuccessCompletion<[Sighting]>, failure: RestClient.FailureCompletion) {
    downloader.fetchSighingList(flowerId: flowerId, success: success, failure: failure)
  }
}
