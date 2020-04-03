//
//  ContentView.swift
//  GlovoCircularView
//
//  Created by Amr AbdelWahab on 4/2/20.
//  Copyright © 2020 Orcas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       CustomView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        Group {
            CustomView()
//            CustomView().colorScheme(.dark)

//        }
    }
}

struct CustomView: View {
    var gradient1: Gradient {
        return Gradient(colors: [.red,.green,.blue])
    }
    var gradient2: Gradient {
        let stops =  [Gradient.Stop(color:.red,location: 0.1),
                      Gradient.Stop(color:.green,location: 0.1),
                      Gradient.Stop(color:.blue,location: 0.1),
        ]
        return Gradient(stops: stops)
    }
   var body: some View {
         VStack {
            Circular(numofArcs: 5).stroke(style: .init(lineWidth: 10)).frame(width: 300, height: 300, alignment: .center).foregroundColor(.green).background(Circle().foregroundColor(.red))
//            Heart().stroke()
               }     }
    

}

struct Heart: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint.init(x: rect.width * 0.25,
                                         y: rect.width * 0.25),
                    radius: rect.width * 0.25,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 180),
                    clockwise: true)
        return path
    }
    
    
}
struct Circular: Shape {
    let numofArcs: Int
    func path(in rect: CGRect) -> Path {
       var largePath = Path()
        let raduis = CGFloat(rect.width / 2)
        let angle = 360 / numofArcs
        let centerX = rect.width / 2
        let centerY = rect.height / 2
        for arc in 0...numofArcs - 1 {
            var path = Path()
            let centerPoint = CGPoint(x: centerX,y: centerY)
            path.addArc(center: centerPoint,
            radius: raduis,
            startAngle: Angle.init(radians:  Double(Double(arc * angle).degreesToRadians)),
            endAngle: Angle.init(radians:  Double(Double((arc + 1) * angle).degreesToRadians)),
            clockwise: false)
            path.addLine(to: centerPoint)
            path.closeSubpath()
            
            largePath.addPath(path)

            }
        return largePath
        }
    }

extension Double {
    var degreesToRadians: CGFloat {
        get {
            return CGFloat((self * .pi) / 180)
        }
    }
}
