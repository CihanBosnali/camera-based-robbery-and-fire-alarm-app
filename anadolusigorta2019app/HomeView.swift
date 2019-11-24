//
//  HomeView.swift
//  anadolusigorta2019app
//
//  Created by cihan on 23.11.2019.
//  Copyright © 2019 Cihan Bosnalı. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseFirestore

var username = "aydaselenbozkurt"


struct HomeView: View {
    
    @State var numberOfPeople = 0
    @State var masterLocked = false
    @State var lastLock = Date()
    
    @State var fireState = 0
    @State var robberyState = 0
    @State var waterState = 0
    
    @State private var showAlert = false

    
    
    var alert: Alert {
        Alert(title: Text("Tehlike"), message: Text("Evinizde tehlikeli bir durum oluşmuştur."), primaryButton: .default(Text("Acil Durum")){}, secondaryButton: .default(Text("Sorun Yok")){})
       }
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

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
                    .frame(height: 250.0)
                    
                    CircleImage()
                    .offset(y: -150)
                    .padding(.bottom, -80)
                    
                    HStack{
                        VStack{
                            Text("Yangın")
                                .fontWeight(Font.Weight.bold)
                            
                            if fireState == 0{
                                Image("tik")
                                Text("Güvenli")
                            } else if fireState == 1{
                                Image("soruis")
                                Text("Güvensiz")
                            }  else if fireState == 2{
                                Image("unlem")
                                Text("Tehlike")
                                                                
                                
                            }

                        }
                        Spacer().frame(width: 30.0)
                        VStack{
                            Text("Hırsızlık")
                                .fontWeight(Font.Weight.bold)
                            if robberyState == 0{
                                Image("tik")
                                Text("Güvenli")
                            } else if robberyState == 1{
                                Image("soruis")
                                Text("Güvensiz")
                            }  else if robberyState == 2{
                                Image("unlem")
                                Text("Tehlike")
                                

                            }
                        }
                        Spacer().frame(width: 30.0)
                        VStack{
                            Text("Sızıntı")
                                .fontWeight(Font.Weight.bold)
                            if waterState == 0{
                                Image("tik")
                                Text("Güvenli")
                            } else if waterState == 1{
                                Image("soruis")
                                Text("Güvensiz")
                            }  else if waterState == 2{
                                Image("unlem")
                                Text("Tehlike")
                                
                            }
                        }
                    }.padding()
                    
                    HStack{
                        Text("İstatistikler")
                            .fontWeight(.bold)
                        Spacer()
                    }.padding()
                    

                    HStack{
                        Text("Kişi Sayısı (Canlı):")
                        Spacer()
                        Text("\(numberOfPeople)").onReceive(timer) { _ in
                            HomeView.getNumberOfPeople(completion: { num_people in
                                self.numberOfPeople = num_people
                            })
                            HomeView.getFireProbabilty { fire in
                                self.fireState = Int(round(fire*2))
                                if self.fireState == 2 && !self.showAlert{
                                    self.showAlert.toggle()
                                }
                            }
                            
                            HomeView.getRobberyProbabilty { robbery in
                                self.robberyState = Int(round(robbery*2))
                                if self.robberyState == 2 && !self.showAlert{
                                    self.showAlert.toggle()
                                }
                            }
                            HomeView.getWaterProbabilty { water in
                                self.waterState = Int(round(water*2))
                                if self.waterState == 2 && !self.showAlert{
                                    self.showAlert.toggle()
                                }
                            }
                        }
                    }.padding()
                    
                    HStack{
                        Text("Son kilit zamanı:")
                        Spacer()
                        Text("\(lastLock)")
                    }.padding()
                    
                    HStack{
                        Text("Olaylar (Son 24 Saat):")
                        Spacer()
                    }.padding()
                }
            }.navigationBarTitle(Text("Evim")).navigationBarItems(trailing: Button(action: {
                self.masterLocked.toggle()
                HomeView.setLastLock(date: Date())
                self.lastLock = Date()
                HomeView.setMasterLockCondition(condition: self.masterLocked)
            }){
                if self.masterLocked {
                    Image("kilit").renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original)).frame(width: 100, height: 100, alignment: .bottom)
                } else {
                    Image("acik").renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original)).frame(width: 100, height: 100, alignment: .bottom)
                }
                }).onAppear{
                    HomeView.getLastMasterLock { (master) in
                        self.masterLocked = master
                    }
                    HomeView.getLastLock { last in
                        self.lastLock = last
                        
                    }
                }.alert(isPresented: $showAlert, content: { self.alert })

        }
    }
    
    
    static func setMasterLockCondition(condition: Bool){
        let db = Firestore.firestore()
        let docRef = db.collection("Users").document(username)
        
        docRef.updateData([
            "masterLock": condition
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    
    static func setLastLock(date: Date){
        let db = Firestore.firestore()
        let docRef = db.collection("Users").document(username)
        
        docRef.updateData([
            "lastLock": date
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    
    static func getLastLock(completion: @escaping (Date) -> ()){
          let db = Firestore.firestore()


          let docRef = db.collection("Users").document(username)

          docRef.getDocument { (document, error) in
              if let document = document, document.exists {
                let lastLockDate = (document.data()?["lastLock"] ?? Date())
                
                completion((lastLockDate as AnyObject).dateValue())

              } else {
                  print("Document does not exist")
              }
        }
    }
    
    static func getNumberOfPeople(completion: @escaping (Int) -> ()){
          let db = Firestore.firestore()
          
          let docRef = db.collection("Users").document(username)

          docRef.getDocument { (document, error) in
              if let document = document, document.exists {
                let num_people = (document.data()?["numberOfPeople"] ?? -1) as! Int
                completion(num_people)

              } else {
                  print("Document does not exist")
              }
        }
    }
    
    static func getFireProbabilty(completion: @escaping (Double) -> ()){
          let db = Firestore.firestore()
          
          let docRef = db.collection("Users").document(username)

          docRef.getDocument { (document, error) in
              if let document = document, document.exists {
                let fire = (document.data()?["fireProbability"] ?? -1) as! Double
                
                completion(fire)

              } else {
                  print("Document does not exist")
              }
        }
    }
    
    static func getRobberyProbabilty(completion: @escaping (Double) -> ()){
          let db = Firestore.firestore()
          
          let docRef = db.collection("Users").document(username)

          docRef.getDocument { (document, error) in
              if let document = document, document.exists {
                let robbery = (document.data()?["robberyProbability"] ?? -1) as! Double
                completion(robbery)

              } else {
                  print("Document does not exist")
              }
        }
    }
    
    static func getWaterProbabilty(completion: @escaping (Double) -> ()){
          let db = Firestore.firestore()
          
          let docRef = db.collection("Users").document(username)

          docRef.getDocument { (document, error) in
              if let document = document, document.exists {
                let water = (document.data()?["waterProbability"] ?? -1) as! Double
                completion(water)

              } else {
                  print("Document does not exist")
              }
        }
    }

    
    static func getLastMasterLock(completion: @escaping (Bool) -> ()){
          let db = Firestore.firestore()
          
          let docRef = db.collection("Users").document(username)

          docRef.getDocument { (document, error) in
              if let document = document, document.exists {
                let master = (document.data()?["masterLock"] ?? true) as! Bool
                completion(master)

              } else {
                  print("Document does not exist")
              }
        }
    }
}
    
  




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
