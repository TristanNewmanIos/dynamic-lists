//
//  ContentView.swift
//  dynamic-lists
//
//  Created by Tristan Newman on 6/13/19.
//  Copyright © 2019 Tristan Newman. All rights reserved.
//

import SwiftUI

//Model
struct User : Identifiable {
    var id: Int
    let username, message, image: String
}

struct ContentView : View {
    
    //Data
    let users : [User] = [
        .init(id: 0, username: "Douglas Quaid", message: "Now get your ass to Mars", image: "douglas_quaid"),
        .init(id: 1, username: "Terminator", message: "I'll be back.", image: "terminator"),
        .init(id: 2, username: "Conan the Barbarian ", message: "To concur your enemies, see them....", image: "conan")
    ]
    
    //Views
    var body: some View {
        NavigationView {
            List {
                Text("Roles").font(.largeTitle)
//                Text($0.username)
                
                ForEach(users.identified(by: \.id)) { user in
                    HStack {
                        Image(user.image)
                            .resizable()
                            .frame(width: 70, height: 70)
                            .clipped()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.black, lineWidth: 4))
                        VStack (alignment: (.leading)){
                            Text(user.username)
                            .font(.headline)
                            Text(user.message)
                            .font(.headline)
                        }
                        .padding(.leading, 8)
                    }
                }
            }
                .navigationBarTitle(Text("Faces of Arnold"))
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
