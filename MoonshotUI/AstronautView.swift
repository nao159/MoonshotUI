//
//  AstronautView.swift
//  MoonshotUI
//
//  Created by Максим Нуждин on 08.05.2021.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                VStack {
                    Image(astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    Text(astronaut.description)
                        .padding()
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name))
    }
}

struct AstronautView_Previews: PreviewProvider {
    
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
