//
//  SimpleTask.swift
//  Functional programing
//
//  Created by Алексей Олудин on 05.12.2024.
//

enum ViewControllerState {
    case loading
    case loaded
    case willAppear
    case didAppear
    case willDisappear
    case didDisappear
}

struct SimpleTask {
    var name: String {
        switch state {
        case .loading: return "Loading..."
        case .loaded: return "Loaded!"
        case .willAppear: return "Will appear..."
        case .didAppear: return "Did appear!"
        case .willDisappear: return "Will disappear..."
        case .didDisappear: return "Did disappear!"
        }
    }
    
    var state: ViewControllerState {
        didSet {
            printState()
        }
    }
    
    init() {
        self.state = .loading
    }
    
    func printState() {
        print(name)
    }
}
