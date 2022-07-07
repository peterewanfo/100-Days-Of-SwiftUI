//
//  RoundCorners.swift
//  RockPaperScissors
//
//  Created by Ewanfo Lucky Peter on 01/07/2022.
//

import SwiftUI

struct RoundCorners : Shape{
    
    var tl : CGFloat = 0.0
    var tr : CGFloat = 0.0
    var br : CGFloat = 0.0
    var bl : CGFloat = 0.0
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        //GET OBJECT TOTAL WIDTH AND HEIGHT
        let w = rect.size.width;
        let h = rect.size.height;
        
        //ENSURE CORNERS NOT BIGGER THAN THE SIZE OF A RECTANGLE
        
        let tl = min(min(self.tl, w/2), h/2)
        let tr = min(min(self.tr, w/2), h/2)
        let br = min(min(self.br, w/2), h/2)
        let bl = min(min(self.bl, w/2), h/2)
        
        //DRAW THE CORNERS
        path.move(to: CGPoint(x: w/2, y: 0))
        
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        
        path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: .degrees(-90), endAngle: .degrees(0), clockwise: false)
        
        
        
        
        path.addLine(to: CGPoint(x: w, y: h - br))
        path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: false)

        path.addLine(to: CGPoint(x: 0 + bl, y: h))
        path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: .degrees(90), endAngle: .degrees(180), clockwise: false)

        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(center: CGPoint(x: 0 + tl, y: tl), radius: tl, startAngle: .degrees(180), endAngle: .degrees(270), clockwise: false)

        path.closeSubpath()
        
        
        
        return path

    }
}

