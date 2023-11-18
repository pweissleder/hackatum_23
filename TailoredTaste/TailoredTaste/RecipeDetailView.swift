//
//  RecipeDetailView.swift
//  TailoredTaste
//
//  Created by Moritz Pötzsch on 18.11.23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var body: some View {
        ScrollView {
            VStack(){
                Image("Pizza")
                    .resizable()
                    .scaledToFit()
                
                    HStack{
                        Spacer()
                        
                        Text("Favorites")
                        Button{
                            print("hello world")
                        } label: {
                            
                        }
                    }
                Text("Pizza").font(.title)
                    .font(.system(.title, design: .default))
                                .foregroundColor(Color.black)
                                .padding(5)
                HStack{
                    ForEach(0..<5) { _ in
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.yellow)
                            
                    }
                }
                HStack{
                    Text("Serves: 1")
                    Image(systemName: "person.2")
            
                }
                HStack{
                    Text("Preparation Time: 10")
                    Image(systemName: "clock")
                }
                HStack{
                    Text("Cooking Time: 20")
                    Image(systemName: "flame")
                }
                HStack{
                    Text("Ingredients")
                }
                VStack(alignment: .center, spacing: 10 ){
                    HStack {
                        Spacer()
                        Text("Nutritional Values")
                            .font(.system(.title, design:
                                    .default))
                        Spacer()
                            }
                    
                }
                HStack{
                    Text("Instructions")
                }
            }
        }
        .ignoresSafeArea(.all)
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView()
    }
}
