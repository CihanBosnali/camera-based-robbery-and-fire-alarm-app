//
//  HomeView.swift
//  anadolusigorta2019app
//
//  Created by cihan on 23.11.2019.
//  Copyright © 2019 Cihan Bosnalı. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(red: 48.0/255.0, green: 31.0/255.0, blue: 92.0/255.0, alpha:1.0)
    
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white]
    }

    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    MapView()
                    .frame(height: 200.0)
                    
                    CircleImage()
                    .offset(y: -80)
                    .padding(.bottom, -80)
                }
                   
            }.navigationBarTitle(Text("Evim"))
            
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
