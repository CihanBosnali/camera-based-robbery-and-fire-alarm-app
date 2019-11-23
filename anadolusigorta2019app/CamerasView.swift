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
                VStack{
                    CameraListRow(videoAvailable: false, cameraAvailable: false, name: "Oturma Odası")
                    CameraListRow(videoAvailable: true, cameraAvailable: true, name: "Mutfak")
                }
                
            }.navigationBarTitle(Text("Evim > Kameralar"))

        }
        
    }
}

struct CamerasView_Previews: PreviewProvider {
    static var previews: some View {
        CamerasView()
    }
}
