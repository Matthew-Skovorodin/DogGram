//
//  LikeAnimationView.swift
//  DogGram
//
//  Created by Matthew Skovorodin on 1/14/24.
//

import SwiftUI

struct LikeAnimationView: View {
    
    @Binding var animate: Bool // binding this bool to another bool in our app so when the other bool get's changed, this one does likewise
    
    var body: some View {
        ZStack {
            
            Image(systemName: "heart.fill")
                .foregroundStyle(Color.red.opacity(0.3))
                .font(.system(size: 200))
                .opacity(animate ? 1.0 : 0.0)
                .scaleEffect(animate ? 1.0 : 0.3)
            
            Image(systemName: "heart.fill")
                .foregroundStyle(Color.red.opacity(0.6))
                .font(.system(size: 150))
                .opacity(animate ? 1.0 : 0.0)
                .scaleEffect(animate ? 1.0 : 0.4)
            
            Image(systemName: "heart.fill")
                .foregroundStyle(Color.red.opacity(0.9))
                .font(.system(size: 100))
                .opacity(animate ? 1.0 : 0.0)
                .scaleEffect(animate ? 1.0 : 0.5)
        }
        //.animation(.linear, value: 2.0)
        .animation(Animation.easeInOut(duration: 0.5), value: animate)
    }
}

//#Preview {
//    
//    @State var animation: Bool = false
//    LikeAnimationView(animate: $animation)
//}
