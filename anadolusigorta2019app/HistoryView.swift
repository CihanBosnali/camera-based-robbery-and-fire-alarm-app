//
//  HistoryView.swift
//  anadolusigorta2019app
//
//  Created by cihan on 23.11.2019.
//  Copyright © 2019 Cihan Bosnalı. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Text("HistoryView!")
            }.navigationBarTitle(Text("Evim > Olaylar"))
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
