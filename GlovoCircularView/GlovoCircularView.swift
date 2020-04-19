//
//  GlovoCircularView.swift
//  GlovoCircularView
//
//  Created by Amr AbdelWahab on 4/19/20.
//  Copyright © 2020 Orcas. All rights reserved.
//

import Foundation
import SwiftUI

struct GlovoCircularView: View {
    let items: [Item]
    let arcCell: (Item)->(ArcCell)
    let width: Int
    var raduis: CGFloat { return  CGFloat(width / 2) }
    var angle: Int {return  360 / items.count }
    var shift: Double {
        return 0
    }
    var centerX: Int { return width / 2  }
    var centerY: Int {return width / 2 }
    var centerPoint: CGPoint { return CGPoint(x: centerX,y: centerY) }

    var body: some View {
        ZStack {
            ForEach(items){ item in
                self.getArcView(item: item)
                
               }
            ForEach(items){ item in
             self.getArcCell(item: item, arcCell: self.arcCell(item))
            }
    }
    }
    private func getArcView(item: Item) -> AnyView {
        let shape = GlovoCircleArc(centerPoint: centerPoint,
                              raduis: raduis,
                              startAngle: Angle.init(radians:  Double(Double(item.index * angle).degreesToRadians)),
                              endAngle: Angle.init(radians:  Double(Double((item.index + 1) * angle).degreesToRadians)),
                              clockwise: false)
        return AnyView( shape.stroke().foregroundColor(item.color).background(shape.foregroundColor(item.color)) )
    }
    private func getArcCell(item: Item, arcCell: ArcCell) -> some View {
        let x = raduis * CGFloat(cos((Double(angle) * Double(item.index)) + shift))
        let y = raduis * CGFloat(sin((Double(angle) * Double(item.index)) + shift))

        return arcCell.position(CGPoint(x: x, y: y))
      }
    
}
