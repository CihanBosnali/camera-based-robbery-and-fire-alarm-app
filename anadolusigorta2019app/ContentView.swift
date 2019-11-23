//
//  ContentView.swift
//  anadolusigorta2019app
//
//  Created by cihan on 23.11.2019.
//  Copyright © 2019 Cihan Bosnalı. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
        init() {
            UITabBar.appearance().backgroundColor = UIColor(red: 36.0/255.0, green: 5.0/255.0, blue: 87.0/255.0, alpha:1.0)
                
            UITabBar.appearance().barTintColor = UIColor(red: 36.0/255.0, green: 5.0/255.0, blue: 87.0/255.0, alpha:1.0)
        }
        
        var body: some View {
            
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Anasayfa")
                }
                CamerasView()
                    .tabItem {
                        Image(systemName: "video.fill")
                        Text("Kameralar")
                }
                HistoryView()
                    .tabItem {
                        Image(systemName: "book.fill")
                        Text("Olaylar")
                }
                PeopleView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Kişiler")
                }
            }.accentColor(Color.white)
           
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
     
