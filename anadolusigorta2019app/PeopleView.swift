//
//  PeopleView.swift
//  anadolusigorta2019app
//
//  Created by cihan on 23.11.2019.
//  Copyright © 2019 Cihan Bosnalı. All rights reserved.
//

import SwiftUI

struct PeopleView: View {
    var body: some View {
        
        NavigationView {

            ScrollView {
                Text("PeopleView!")
            }.navigationBarTitle(Text("Evim > Kişiler"))
        }
        
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
    }
}
