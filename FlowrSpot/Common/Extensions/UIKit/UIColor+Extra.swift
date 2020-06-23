//
//  UIColor+Extra.swift
//  CoinMarket
//
//  Created by TK on 04/11/2017.
//  Copyright © 2017 TK. All rights reserved.
//

import UIKit

extension UIColor {
  convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) {
    self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
  }
}

// MARK: - Theme Colors

extension UIColor {
  static let flowrGray = UIColor(r: 148, g: 158, b: 160)
  static let flowrPink = UIColor(r: 223, g: 145, b: 134)
  static let sightingDarkGray = UIColor(red: 0.2, green: 0.255, blue: 0.267, alpha: 1)
  static let sightingLightGray = UIColor(red: 0.58, green: 0.619, blue: 0.628, alpha: 1)
  static let separatorGrayColor = UIColor(red: 0.91, green: 0.914, blue: 0.929, alpha: 1)
  static let locationOrange = UIColor(red: 0.875, green: 0.569, blue: 0.525, alpha: 1)
}
