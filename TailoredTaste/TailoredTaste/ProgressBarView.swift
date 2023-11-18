//
//  ProgressBarView.swift
//  TailoredTaste
//
//  Created by Pascal Weißleder on 18.11.23.
//

import SwiftUI

struct ProgressBarView: View {
    @State private var drawingWidth = false
    @State var currentState: CGFloat
    var name: String
    var finalState: CGFloat
    var color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .bold()
            HStack {
                Text(String(Int(currentState))).font(.caption)
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color(.systemGray6))
                    RoundedRectangle(cornerRadius: 5)
                        .fill(color)
                        .frame(width: drawingWidth ? (( currentState / finalState) * 250) : 0)
                        .animation(.easeInOut(duration: 2), value: drawingWidth)
                }
                .frame(width: 250, height: 12)
                .onAppear {
                                drawingWidth.toggle()
                            }
                Text(String(Int(finalState))).font(.caption2)
            }
        }
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(currentState: 30, name: "Carbs", finalState: 40, color: .accentColor)
    }
}
