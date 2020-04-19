//
//  ExtensionDouble.swift
//  GlovoCircularView
//
//  Created by Amr AbdelWahab on 4/19/20.
//  Copyright © 2020 Orcas. All rights reserved.
//

import Foundation
import UIKit

extension Double {
    var degreesToRadians: CGFloat {
        get {
            return CGFloat((self * .pi) / 180)
        }
    }
}
