//
//  TimeHolder.swift
//  TOEIC_kanri
//
//  Created by Soichiro Kuroyanagi on 2020/03/31.
//  Copyright © 2020 kute. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class TimerHolder : ObservableObject {
    @Published var timer : Timer!
    @Published var count = 0
    

   func start() {
       self.timer?.invalidate()
       self.count = 0
       self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) {
           _ in
           self.count += 1
       }
   }
}
