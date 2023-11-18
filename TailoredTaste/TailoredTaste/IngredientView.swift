//
//  IngredientView.swift
//  TailoredTaste
//
//  Created by Moritz Pötzsch on 18.11.23.
//

import SwiftUI

struct IngredientView: View {
    var name : String
    var value : Int
    var unit : String
    //var image : Url
    
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            
            Image("Pizza") //Hier Ingredient image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
            
            HStack{
            Text("Cheese, ")//hier name
                .font(.footnote)
                .multilineTextAlignment(TextAlignment.leading)
                .fixedSize(horizontal: false, vertical: true)
                .padding(-5)
            Text("100") //Ingredient amount
                    .font(.footnote)
                    .multilineTextAlignment(TextAlignment.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(-5)
            Text("g") //Ingredient Unit
                    .font(.footnote)
                    .multilineTextAlignment(TextAlignment.leading)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(5)
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView(name: "name", value: 10, unit: "g")
    }
}
