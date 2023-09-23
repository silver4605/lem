//
//  Homeel.swift
//  LEMO
//
//  Created by Admin on 23.09.2023.
//

import SwiftUI

struct Home: View {
        let persistence = PersistenceController.shared
    var body: some View {
        TabView {
            Menu()
                .environment(\.managedObjectContext, persistence.container.viewContext)
                .tabItem {
                Label("Menu", systemImage: "list.dash")
            }
            Profile().tabItem {
                Label("Profile", systemImage: "square.and.pencil")
            }
            
        } .navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
