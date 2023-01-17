//
//  CaffeineModel.swift
//  CaffeineHolic2
//
//  Created by cnu on 2023/01/17.
//

import Foundation

class CaffeineModel {
    enum CaffeineState: String {
        case Intro
        case Wakening
        case Stressful
        case Rest
    }
    let originList = ["First", "Second"]
    var dailyList:[String] = []
    var currentState:CaffeineState = .Intro
    var imgFrame:CGSize = CGSize(width: 200.0, height: 200.0)
    
    func incImgSize() {
        var newFrame:CGSize = imgFrame
        newFrame.height += 10
        newFrame.width += 10
        if newFrame.height < 350 {
            imgFrame = newFrame
        }
    }
    func resetImgSize() {
        imgFrame = CGSize(width: 200.0, height: 200.0)
    }
    func getStateImg() -> String {
        switch(currentState) {
        case .Intro:
            return "Profile." + currentState.rawValue
        case .Wakening:
            return "Profile." + currentState.rawValue
        case .Stressful:
            return "Profile." + currentState.rawValue
        case .Rest:
            return "Profile." + currentState.rawValue
        }
    }
    
    private func changeState(newState:CaffeineState) ->(Bool, [String]) {
        var result:Bool = false
        
        addDailyList(state: newState)
        
        if newState != self.currentState {
            result = true
            self.currentState = newState
            resetImgSize()
        }
        
        else {
            incImgSize()
        }
        
        return (result, dailyList)
    }
    
    private func addDailyList(state:CaffeineState) {
        switch(state) {
        case .Intro:
            dailyList.insert("New", at: 0)
        case .Wakening:
            dailyList.insert("Get Some Coffee", at: 0)
        case .Stressful:
            dailyList.insert("Stress Up", at: 0)
        case .Rest:
            dailyList.insert("Rest", at: 0)
        }
    }
    
    func doWakening() -> (Bool, [String]) {
        return changeState(newState: .Wakening)
    }
    func doStressful() -> (Bool, [String]) {
        return changeState(newState: .Stressful)
    }
    func doRest() -> (Bool, [String]) {
        return changeState(newState: .Rest)
    }
    func doReset() -> (Bool, [String]) {
        dailyList.removeAll()
        return changeState(newState: .Intro)
    }
    
}
