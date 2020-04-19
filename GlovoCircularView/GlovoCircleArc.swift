//
//  GlovoCircleArc.swift
//  GlovoCircularView
//
//  Created by Amr AbdelWahab on 4/19/20.
//  Copyright © 2020 Orcas. All rights reserved.
//

import Foundation
import SwiftUI

struct GlovoCircleArc: Shape {
    let centerPoint: CGPoint
    let raduis: CGFloat
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    func path(in rect: CGRect) -> Path {
        var path = Path()
       
        path.addArc(center: centerPoint,
        radius: raduis,
        startAngle: startAngle,
        endAngle: endAngle,
        clockwise: clockwise)
        path.addLine(to: centerPoint)
        path.closeSubpath()
        return path
    }
}
