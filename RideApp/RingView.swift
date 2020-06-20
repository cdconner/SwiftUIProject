//
//  RingView.swift
//  RideApp
//
//  Created by Christopher Conner on 6/20/20.
//  Copyright © 2020 Christopher Conner. All rights reserved.
//

import SwiftUI

struct RingView: View {
    
    var percentage: Double
    var startColor: Color
    var endColor: Color
    var body: some View {
        let gradient = AngularGradient(gradient: Gradient(colors: [startColor, endColor]), center: .center, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360))
        return ZStack {
            RingBackgroundShape()
            RingShape(currentPercentage: percentage)
            .fill(gradient)
                .rotationEffect(.init(degrees: -90))
            .shadow(radius: 2)
            .drawingGroup()
                .animation(.easeInOut)
        }
    }
}

struct RingShape: Shape {
    
    var currentPercentage: Double
    
    func path(in rect: CGRect) -> Path {
        
        let thickness: CGFloat = 30
        
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = rect.width / 2 - thickness
        
        var path = Path()
        path.addArc(center: center, radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360
        * currentPercentage), clockwise: false)
        
        return path.strokedPath(.init(lineWidth: thickness, lineCap: .round, lineJoin: .round))
    }
    var animatableData: Double {
        get { return currentPercentage }
        set { currentPercentage = newValue }
    }
}

struct RingBackgroundShape: Shape {
    func path(in rect: CGRect) -> Path {
        
        let thickness: CGFloat = 30
        
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = rect.width / 2 - thickness
        
        var path = Path()
        path.addArc(center: center, radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: false)
        
        return path.strokedPath(.init(lineWidth: thickness, lineCap: .round, lineJoin: .round))
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(percentage: 0.5, startColor: .red, endColor: .pink)
    }
}
