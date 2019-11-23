//
//  AppView.swift
//  anadolusigorta2019app
//
//  Created by cihan on 23.11.2019.
//  Copyright © 2019 Cihan Bosnalı. All rights reserved.
//

import SwiftUI

struct AppView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(red: 36.0/255.0, green: 5.0/255.0, blue: 87.0/255.0, alpha:1.0)
            
        UITabBar.appearance().barTintColor = UIColor(red: 36.0/255.0, green: 5.0/255.0, blue: 87.0/255.0, alpha:1.0)
    }
    
    var body: some View {
        
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
            }

            TestView()
                .tabItem {
                    Image(systemName: "video.fill")
                    Text("Cameras")
            }
            TestView()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("History")
            }
            TestView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("People")
            }
        }.accentColor(Color.white)

    }
}


struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
