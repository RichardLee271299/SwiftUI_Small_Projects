//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Kirill Sytkov on 15.07.2022.
//

import SwiftUI

struct MotionAnimationView: View {
   //MARK: - Properties
   @State private var randomCircle = Int.random(in: 12...16)
   @State private var isAnimation = false
   
   //MARK: - FUNC
      //1. random coordinate
   private func randomCoordinate(max:CGFloat) -> CGFloat {
      return CGFloat.random(in: 0...max)
   }
      //2. random size
   private func randomSize() -> CGFloat {
      return CGFloat(Int.random(in: 10...300))
   }
      //3. random scale
   private func randomScale() -> CGFloat {
      return CGFloat(Double.random(in: 0.1...2.0))
   }
      //4. random speed
   private func randomSpeed() -> Double {
      return Double.random(in: 0.025...1)
   }
      //5. random delay
   private func randomDelay() -> Double {
      return Double.random(in: 0...2)
   }
   
   //MARK: - BODY
    var body: some View {
       GeometryReader { geometry in
          ZStack {
             ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                   .foregroundColor(.gray)
                   .opacity(0.15)
                   .frame(width: randomSize(), height: randomSize(), alignment: .center)
                   .scaleEffect(isAnimation ? randomScale() : 1)
                   .position(x: randomCoordinate(max: geometry.size.width), y: randomCoordinate(max: geometry.size.height))
                   .animation(Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                     .repeatForever()
                     .speed(randomSpeed())
                     .delay(randomDelay())
                   )
                   .onAppear {
                      isAnimation = true
                   }
             } //LOOP
          } //ZSTACK
          .drawingGroup()
       } //GEOMETRY
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
