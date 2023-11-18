//
//  NutritionalItemView.swift
//  TailoredTaste
//
//  Created by Moritz Pötzsch on 18.11.23.
//

import SwiftUI

struct NutritionalItemView: View {
    
    var value: Int
    var name: String
    var unitName: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 2) {
            Text("\(value)\(unitName)")
                .foregroundColor(Color(UIColor.systemGray))
                .font(.system(.headline))
            Text(name)
                .font(.system(.caption))
        }
        .frame(width:80, height: 80)
        .background(
            Circle()
                .fill(Color(UIColor.systemBackground))
                .frame(width:60, height: 60)
            )
        .background(
            Circle()
                .fill(Color(UIColor.systemGray))
                .frame(width:63, height: 63)
            )
    }
    static var previews: some View {
        Group {
            NutritionalItemView(value: 123, name: "Calories", unitName: "g").colorScheme(.light)
                .previewLayout(.sizeThatFits)
            NutritionalItemView(value: 78, name: "Calories", unitName: "g").colorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}

struct NutritionalItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NutritionalItemView(value: 123, name: "Calories", unitName: "g").colorScheme(.light)
                .previewLayout(.sizeThatFits)
            NutritionalItemView(value: 78, name: "Calories", unitName: "g").colorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
