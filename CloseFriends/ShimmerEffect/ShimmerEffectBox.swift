//
//  ShimmerEffectBox.swift
//  CloseFriends
//
//  Created by Batuhan Küçükyıldız on 24.08.2023.
//

import SwiftUI

struct ShimmerEffectBox: View {
    @State private var isAnimating : Bool = false
    
    private var gradientColors = [
        Color(uiColor:UIColor.systemGray5),
        Color(uiColor:UIColor.systemGray6),
        Color(uiColor:UIColor.systemGray5)
    ]
    @State var startPoint : UnitPoint = .init(x: -1.8, y: -1.2)
    @State var endPoint : UnitPoint = .init(x: 0, y: -0.2)

    var body: some View {
        LinearGradient(colors: gradientColors, startPoint: startPoint , endPoint: endPoint)
            .onAppear{
                withAnimation(.easeInOut(duration: 1)
                    .repeatForever(autoreverses: false)){
                        startPoint = .init(x: 1, y: 1)
                        endPoint = .init(x: 2.2, y: 2.2)
                        
                    }
            }
    }
}

struct ShimmerEffectBox_Previews: PreviewProvider {
    static var previews: some View {
        ShimmerEffectBox()
    }
}
