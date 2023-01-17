//
//  ContentView.swift
//  CaffeineHolic2
//
//  Created by cnu on 2023/01/17.
//

import SwiftUI

struct ContentView: View {
    @State var caffeine:CaffeineModel = CaffeineModel()
    @State private var dailyList = ["First", "Second"]
    @State var result:Bool = true
    
    func incCoffee() {
        //        dailyList.insert("Get Some Coffee", at: 0)
        (result, dailyList) = caffeine.doWakening()
    }
    
    func incStress() {
        //        dailyList.insert("Stress Up", at: 0)
        (result, dailyList) = caffeine.doStressful()
    }
    
    func getRest() {
        //        dailyList.insert("Rest", at: 0)
        (result, dailyList) = caffeine.doRest()
    }
    
    func resetState() {
        (result, dailyList) = caffeine.doReset()
    }
    var Buttons: some View {
        VStack {
            HStack (spacing: 20) {
                Text("")
                Spacer()
                //                Text("Top Button")
                Button("Clear") {
                    print("Top Button Click")
                    resetState()
                    //                    (result, dailyList) = caffeine.doReset()
                }.padding()
            }
            Spacer()
            Image(caffeine.getStateImg())
                .resizable()
                .frame(width: caffeine.imgFrame.width, height: caffeine.imgFrame.height)
            Spacer()
            HStack {
                Button("Get Stress") {
                    print("")
                    incStress()
                }.padding()
                Button("Go to Caffeine") {
                    print("Click")
                    incCoffee()
                }
                Button("Get Some Rest") {
                    print("Click")
                    getRest()
                }
            }
        }
        .padding()
    }
    var DailyView: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 20) {
                List(dailyList, id: \.self) {item in
                    Text(item)
                }
                Spacer()
                Text("")
            }
            .frame(width: 200)
            .opacity(0.3)
            Spacer()
        }
        .padding()
    }
    
    var body: some View {
        ZStack{
            DailyView
            Buttons
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
