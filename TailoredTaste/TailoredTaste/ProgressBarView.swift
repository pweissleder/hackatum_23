//
//  ProgressBarView.swift
//  TailoredTaste
//
//  Created by Pascal Weißleder on 18.11.23.
//

import SwiftUI

struct ProgressBarView: View {

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
                    RoundedRectangle(cornerRadius: 3)
                        .fill(Color(.systemGray6))
                    Text(String(Int(( currentState / finalState) * 250)))
                    RoundedRectangle(cornerRadius: 3)
                        .fill(color)
                        .frame(width: CGFloat((Int(currentState) / Int(finalState)) * 250))
                    
                }
                .frame(width: 250, height: 12)
                Text(String(Int(finalState))).font(.caption)
            }
        }
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(currentState: 30, name: "Carbs", finalState: 40, color: .accentColor)
    }
}
