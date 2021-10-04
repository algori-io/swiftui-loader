//
//  ALLoadingView.swift
//  EconomyCitizen
//
//  Created by Farrukh Khakimov on 06/04/21.
//

import SwiftUI

public struct ALLoadingView: View {
    @State private var isLoading = false
    private let color: Color
    private let size: CGFloat
    private let animation = Animation.linear(duration: 0.8).repeatForever(autoreverses: false)
    
    public init(color: Color, size: CGFloat) {
        self.color = color
        self.size = size
    }
    
    public var body: some View {
        Circle()
            .trim(from: 0, to: 0.75)
            .stroke(color, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
            .background(Circle().stroke(color, lineWidth: 5).opacity(0.2))
            .frame(width: size, height: size)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .onAppear {
                DispatchQueue.main.async {
                    withAnimation(animation) {
                        isLoading = true
                    }
                }
            }
    }
}
