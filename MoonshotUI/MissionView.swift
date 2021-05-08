//
//  MissionView.swift
//  MoonshotUI
//
//  Created by Максим Нуждин on 06.05.2021.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    let mission: Mission
    let astronauts: [CrewMember]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geo.size.width * 0.7)
                        .padding(.top)
                    Text(mission.formattedLaunchDate)
                    Text(mission.description)
                        .padding()
                    ForEach(self.astronauts, id: \.role) { crewmember in
                        NavigationLink(
                            destination: AstronautView(astronaut: crewmember.astronaut)) {
                            HStack {
                                Image(crewmember.astronaut.id)
                                    .resizable()
                                    .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .clipShape(Capsule())
                                    .overlay(Capsule()
                                                .stroke(Color.primary, lineWidth: 5))
                                VStack(alignment: .leading) {
                                    Text(crewmember.astronaut.name)
                                        .font(.headline)
                                    Text(crewmember.role)
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                            }.padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
        .navigationBarTitle(Text(mission.displayName), displayMode: .large)
    }
    
    init(mission: Mission, astronauts: [Astronaut]) {
        self.mission = mission
        
        var matches = [CrewMember]()
        
        for member in mission.crew {
            if let match = astronauts.first(where: {$0.id == member.name}) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }
        self.astronauts = matches
    }
}

struct MissionView_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[1], astronauts: astronauts)
    }
}
