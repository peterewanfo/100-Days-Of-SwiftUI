//
//  RoundedCornersExample.swift
//  RockPaperScissors
//
//  Created by Ewanfo Lucky Peter on 01/07/2022.
//

import SwiftUI

struct RoundedCornersExample : View {
    var body: some View {
        
        VStack{
            
        Text("Hello world")
            .foregroundColor(.black)
            .font(.largeTitle)
            .padding(20)
            .frame(width: 300, height: 900)
            .background(RoundedCorners(tl: 2000, tr: 400, bl: 400, br: 400).stroke(Color.blue))
            
            VStack{
                Text("Let's Play")
                    .padding()
                    .foregroundColor(.black)
            }
            .frame(width: 200, height: 40)
            .background(.red)
            
        }
        
    }
}



struct RoundedCorners: Shape {
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let w = rect.size.width
        let h = rect.size.height
        
        
        // Make sure we do not exceed the size of the rectangle
        let tr = min(min(self.tr, h/2), w/2)
        let tl = min(min(self.tl, h/2), w/2)
        let bl = min(min(self.bl, h/2), w/2)
        let br = min(min(self.br, h/2), w/2)
        
        path.move(to: CGPoint(x: w / 2.0, y: 0))
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        
        path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        
        path.addLine(to: CGPoint(x: w, y: h - br))
        path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br,
                    startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)

        path.addLine(to: CGPoint(x: bl, y: h))
        path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl,
                    startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)

        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(center: CGPoint(x: tl, y: tl), radius: tl,
                    startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        
        path.closeSubpath()

        return path
    }
}


struct RoundedCornersExample_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            RoundedCornersExample()
        }
        
    }
}
