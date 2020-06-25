//
//  ContentView.swift
//  GlovoCircularView
//
//  Created by Amr AbdelWahab on 4/2/20.
//  Copyright © 2020 Orcas. All rights reserved.
//

import SwiftUI

@main
struct iOSAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
       CustomView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            CustomView()
    }
}

struct CustomView: View {
    let items = [Item(index: 1, name: "1",color: .red),
                 Item(index: 2, name: "2",color:.green),
                 Item(index: 3, name: "3",color:.yellow),
                 Item(index: 4, name: "4",color:.blue),
                 Item(index: 5, name: "5",color:.gray),
                 Item(index: 6, name: "6",color: .purple)]
   var body: some View {
    
    Circular2(items:items, arcCell: { item in
        return ArcCell.init(name: item.name)
    }
 , width: 400)
      }
}

struct Circular2: View {
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
//            ForEach(items){ item in
//             self.getArcCell(item: item, arcCell: self.arcCell(item))
//            }
    }
    }
    private func getArcView(item: Item) -> AnyView {
        let shape = CircleArc(centerPoint: centerPoint,
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
struct CircleArc: Shape {
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
extension Double {
    var degreesToRadians: CGFloat {
        get {
            return CGFloat((self * .pi) / 180)
        }
    }
}

struct Item: Identifiable {
    let id = UUID()
    let index: Int
    let name: String
    let color: Color
}

struct ArcCell: View {
    let name: String
    var body: some View {
        Text(name).foregroundColor(.pink)
    }
}
