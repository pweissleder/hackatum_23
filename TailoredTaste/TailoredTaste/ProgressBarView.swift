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
                .padding(.horizontal, 10)
            HStack {
                Text(String(Int(currentState)))
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 5)
                    .frame(width:60)
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
                                drawingWidth =  true
                            }
                Text(String(Int(finalState)))
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 5)
                    .frame(width:60)
                
            }
        }
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(currentState: 30, name: "Carbs", finalState: 40, color: .accentColor)
    }
}
