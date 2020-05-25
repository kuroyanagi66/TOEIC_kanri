//
//  DecideQuestion.swift
//  TOEIC_kanri
//
//  Created by Soichiro Kuroyanagi on 2020/03/31.
//  Copyright © 2020 kute. All rights reserved.
//

import SwiftUI

/*
class User: ObservableObject {
    @Published var name = "Taylor Swift"
}*/
struct DecideQuestion: View {
    
    @State private var selection = 49
    @State private var selection2 = 49
    @EnvironmentObject var setumon: Setumon
    @State var text_ = ""
   
    var body: some View {
        
        //self.kaisi = selection + 101
      
        VStack{
            
            
            

                
            HStack{
                Text("設問登録　問\(self.selection + 101) ~ 問\(self.selection2 + 101)")
                
                Button(action: {
                    self.text_ = "問\(self.selection + 101) ~ 問\(self.selection2 + 101)"
                    //self.setumon.setumons.append(self.text_)
                    
                    self.setumon.setumons = self.text_
                }){
                        Text("登録")
                    }.padding()
            }


            
        Text("開始番号")
            Picker(selection: $selection, label: Text("問題番号")) {
    
                              ForEach(101 ..< 201) { num in
                                  Text(String(num))
                                  
                              }
                          }
                          .labelsHidden()
            
            Text("終了番号")
                Picker(selection: $selection2, label: Text("問題番号")) {
                                  ForEach(101 ..< 201) { num in
                                      Text(String(num))
                                      
                                  }
                              }
                              .labelsHidden()
        }
        
    }
}

struct DecideQuestion_Previews: PreviewProvider {
   static let setumon = Setumon()
    static var previews: some View {
    DecideQuestion().environmentObject(setumon)
    }
}
