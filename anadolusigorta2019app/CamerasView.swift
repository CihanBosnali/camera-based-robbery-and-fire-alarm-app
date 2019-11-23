//
//  CamerasView.swift
//  anadolusigorta2019app
//
//  Created by cihan on 23.11.2019.
//  Copyright © 2019 Cihan Bosnalı. All rights reserved.
//

import SwiftUI

struct CamerasView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                CameraListRow(videoAvailable: false, cameraAvailable: true, name: "Oturma Odası")
            }.navigationBarTitle(Text("Evim > Kameralar"))

        }
        
    }
}

struct CamerasView_Previews: PreviewProvider {
    static var previews: some View {
        CamerasView()
    }
}
