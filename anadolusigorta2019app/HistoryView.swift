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
            List {
                HStack{
                    Text("Yangın tehlikesi oluştu. Kullanıcı tarafından önlendi.")
                       .multilineTextAlignment(.leading)
                       .lineLimit(3)
                    Spacer()
                    Text("Dün 10:15")
                }
                HStack{
                    Text("Su baskını tehlikesi oluştu. Tamirci çağrıldı. Önlendi.")
                       .multilineTextAlignment(.leading)
                       .lineLimit(3)
                    Spacer()
                    Text("17/03/19 17:15")
                }
               
            }.navigationBarTitle(Text("Evim > Olaylar"))
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
