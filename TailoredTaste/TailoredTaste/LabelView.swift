//
//  LabelView.swift
//  TailoredTaste
//
//  Created by Pascal Weißleder on 18.11.23.
//

import Foundation
import SwiftUI

struct LabelView: View {
    
    let image: String
    
    var body: some View {
        Image(systemName: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 35, height: 35)
            .foregroundColor(.accentColor)
    }
}
