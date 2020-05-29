//
//  StopWatch.swift
//  TOEIC_kanri
//
//  Created by Soichiro Kuroyanagi on 2020/03/31.
//  Copyright © 2020 kute. All rights reserved.
//

import SwiftUI

struct StopWatch: View {


        @State var timeRemaining = 0
        @State var goukei = 0
        @State var flag = 0
        @State var flag2 = 0
        @State var hour = 0
        @State var min = 0
        @State var sec = 0
        @State var hour2 = "00"
        @State var min2 = "00"
        @State var sec2 = "00"
        @State var goukei_text = "00 : 00 . 00"
        @State var goukei_top = "00 : 00 . 00"
        @State private var selection = 3
        @State var showingDetail = false
        @State var num = 0
        @State var nokori_time = 4500 // min
        @State var nokori_text = "01 : 15 . 00"
  
    
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
      @State  var kiroku: [String] = []
    @EnvironmentObject var setumon: Setumon
    
    @State private var familyName = ""
    @State private var firstName = ""
    @State private var invalid = false
    
    var body: some View {
       
       
        NavigationView{
            
        VStack{
            
            /*
            List{
                        ForEach(setumon.setumons, id: \.self){aa in
                            Text(aa)
                        }
                    }
*/
            Button(action:{
              
                self.showingDetail.toggle()}){
                Text("設問選択").font(.title)
            }      .sheet(isPresented: $showingDetail){
             DecideQuestion().environmentObject(self.setumon)
                  }.navigationBarTitle("")
                  .navigationBarHidden(true)
            Text(self.setumon.setumons).font(.title)

        //Text("\(timeRemaining)")合計時間（秒）
        //Text("\(hour2) : \(min2) : \(sec2)")
        Text(goukei_top).font(.largeTitle)
            
            Group{
            Button(action: {
                if self.setumon.setumons != "" && self.flag == 0 {
                self.flag = 1
                    self.flag2 = 1}
                
            }) {
            Text("START").font(.title)
        }
                
                
           .onReceive(timer) { _ in
                if  self.timeRemaining >= 0
            && self.flag == 1 && self.hour < 100 {
                   
                 self.timeRemaining += 1
                    self.goukei_top = method1(intValue: self.timeRemaining)
            
                    
               }
            }
            
            
                Button(action: {self.flag = 0}) {
                Text("STOP").font(.title)
            }
            
            
                Button(action: {//self.flag = 0
                    if
                     self.flag == 0{
                self.timeRemaining = 0
                    self.hour2 = "00"
                    self.min2 = "00"
                        self.sec2 = "00"
                        self.goukei_top = method1(intValue: self.timeRemaining)
                         self.setumon.setumons = ""
                    }
        
                }) {
                Text("RESET").font(.title)
                }
            
 
            Button(action: {
              
                if self.flag2 == 1 && self.flag == 0 && self.timeRemaining != 0{
               //ここでリストに追加
                    self.kiroku.append(self.setumon.setumons + "    " + method1(intValue: self.timeRemaining))
                    self.flag2 = 0
                    
                    self.goukei += self.timeRemaining
                    self.nokori_text = method1(intValue: method2(intValue1: self.nokori_time, intValue2: self.goukei))
                                        self.goukei_text = method1(intValue: self.goukei)
                    
                    self.setumon.setumons = ""
                  self.timeRemaining = 0
                    self.goukei_top = method1(intValue: self.timeRemaining)
                }
                
            }) {
                Text("REGISTER").font(.title)
            }
            

            }
            
            Text("合計時間 　 \(self.goukei_text)").font(.title)
            Text("残り時間 　 \(self.nokori_text)").font(.title)
            
            /*
            Button(action: {self.showingDetail.toggle()}){
                 Text("設問登録")
                
                    .font(.largeTitle)
                      .foregroundColor(Color.white)
                     .frame(width:200, height:4)
                 
                     //.border(Color.blue, width:2)
                  } .padding(.all)
                             .background(Color.blue)
                  .cornerRadius(30)
                 .sheet(isPresented: $showingDetail){
                   DecideQuestion()
                   
            }*/
           
            List {
            ForEach(kiroku, id: \.self) { k in
                //self.num += 1
                HStack{
  Text("\(k)")
           // Text(method1(intValue: k))
                   
                }
                }
                //

                }
            Button(action: {
                
                self.kiroku = []
                self.goukei = 0
                self.goukei_text = "00 : 00 . 00"
                self.nokori_text = "00 : 00 . 00"
                
            }) {
                Text("Reset all")
            }
           
        }
    }
        
        
}






struct StopWatch_Previews: PreviewProvider {
     static let setumon = Setumon()
    static var previews: some View {
       StopWatch().environmentObject(setumon)
    }
}


}




func method1(intValue: Int) -> String {
    let hour = intValue / 3600
    let min = intValue % 3600 / 60
    let sec = intValue % 3600 % 100
    var hour2 = "00"
    var min2 = "00"
    var sec2 = "00"
    if hour < 10 {
        hour2 = "0" + String(hour)
    }else{
        hour2 = String(hour)
    }
    
    if min < 10 {
        min2 = "0" + String(min)
    }else{
        min2 = String(min)
    }
    
    if sec < 10 {
        sec2 = "0" + String(sec)
    }else{
        sec2 = String(sec)
    }
    let time_text = "\(hour2) : \(min2) . \(sec2)"
    return time_text
}


func method2(intValue1: Int, intValue2: Int) -> Int {
    let sa = intValue1 - intValue2
    return sa
}
