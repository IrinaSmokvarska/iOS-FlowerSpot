//
//  CLLocation.swift
//  FlowrSpot
//
//  Created by Irina Smokvarska on 6/23/20.
//  Copyright © 2020 PovioLabs. All rights reserved.
//

import Foundation
import UIKit
import MapKit

extension CLLocation {
    func fetchCityAndCountry(completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.locality, $0?.first?.country, $1) }
    }
}
