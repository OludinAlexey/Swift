//
//  ViewController.swift
//  Traffic Lights. CALayer
//
//  Created by Алексей Олудин on 12.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var trafficLightRed: CircleLayer = CircleLayer()
    var trafficLightYellow: CircleLayer = CircleLayer()
    var trafficLightGreen: CircleLayer = CircleLayer()
    var currentLight: CircleLayer = CircleLayer()
    private lazy var startStopButton = CustomButton(configuration: ButtonConfiguration.primary(title: "Start", action: primary))
    
    private let onLightOpacity: Float = 1
    private let offLightOpacity: Float = 0.5
    private let shortDelay: TimeInterval = 2
    private let longDelay: TimeInterval = 5
    private let duration: TimeInterval = 0.3
    
    private var delay: TimeInterval = 0
    private var redOpacity: Float = 0.5
    private var yellowOpacity: Float = 0.5
    private var greenOpacity: Float = 0.5
    private var isFirstStart: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeLayer()
    }
    
    private func makeLayer(){
        trafficLightRed = CircleLayer(params: CircleLayerParams.red(x: Int(view.center.x), y: Int(view.center.y) - 150))
        trafficLightYellow = CircleLayer(params: CircleLayerParams.yellow(x: Int(view.center.x), y: Int(view.center.y)))
        trafficLightGreen = CircleLayer(params: CircleLayerParams.green(x: Int(view.center.x), y: Int(view.center.y) + 150))
        currentLight = trafficLightRed
        
        view.layer.addSublayer(trafficLightRed)
        view.layer.addSublayer(trafficLightYellow)
        view.layer.addSublayer(trafficLightGreen)
        view.addSubview(startStopButton)
        
        
        NSLayoutConstraint.activate([
            startStopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startStopButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 290)
        ])
    }
    
    
    private func primary() {
        print("This is action from PRIMARY button")
        startStopButton.isStarted.toggle()
        startStopButton.setTitle(startStopButton.isStarted ? "Pause" : "Start", for: .normal)
        self.currentLight = trafficLight(currentTrafficLight: self.currentLight)
    }
    
 
    
    private func trafficLight(currentTrafficLight: CircleLayer) -> CircleLayer {
        var currentLight = currentTrafficLight
        guard startStopButton.isStarted else {
            currentTrafficLight.removeAllAnimations()
            trafficLightRed.removeAllAnimations()
            trafficLightYellow.removeAllAnimations()
            trafficLightGreen.removeAllAnimations()
            
            if currentTrafficLight == self.trafficLightRed {
                currentLight = self.trafficLightYellow
            } else if currentLight == self.trafficLightYellow {
                currentLight = self.trafficLightGreen
            } else if currentLight == self.trafficLightGreen {
                currentLight = self.trafficLightRed
            } else {
                currentLight = self.trafficLightYellow
            }
            
            return currentLight
        }
        
        
        var delay: Double
        if currentLight == trafficLightRed && isFirstStart {
            delay = 0
            isFirstStart = false
        } else {
            delay = currentLight.delay
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            print("Timer fired!")
            self.startLightAnimation(trafficLight: currentLight)
            if currentLight == self.trafficLightRed {
                currentLight = self.trafficLight(currentTrafficLight: self.trafficLightYellow)
            } else if currentLight == self.trafficLightYellow {
                currentLight = self.trafficLight(currentTrafficLight: self.trafficLightGreen)
            } else if currentLight == self.trafficLightGreen {
                currentLight = self.trafficLight(currentTrafficLight: self.trafficLightRed)
            } else {
                currentLight = self.trafficLight(currentTrafficLight: self.trafficLightYellow)
            }
        }
        
        return currentLight
    }
    
    private func startLightAnimation(trafficLight: CircleLayer) {
        
        let group = CAAnimationGroup()
        group.duration = 2.6
        group.fillMode = .forwards
        group.isRemovedOnCompletion = false
        
        
        let startVisibleOpacity = CABasicAnimation(keyPath: "opacity")
        startVisibleOpacity.fromValue = offLightOpacity
        startVisibleOpacity.toValue = onLightOpacity
        startVisibleOpacity.duration = duration
        startVisibleOpacity.isRemovedOnCompletion = false
        startVisibleOpacity.fillMode = .forwards
        
        let endVisibleOpacity = CABasicAnimation(keyPath: "opacity")
        endVisibleOpacity.fromValue = onLightOpacity
        endVisibleOpacity.toValue = offLightOpacity
        endVisibleOpacity.duration = duration
        endVisibleOpacity.isRemovedOnCompletion = false
        endVisibleOpacity.fillMode = .forwards
        endVisibleOpacity.beginTime = duration + 2
        
        let onVisibleOpacity = CABasicAnimation(keyPath: "opacity")
        onVisibleOpacity.fromValue = onLightOpacity
        onVisibleOpacity.toValue = onLightOpacity
        onVisibleOpacity.duration = 2
        onVisibleOpacity.isRemovedOnCompletion = false
        onVisibleOpacity.fillMode = .forwards
        onVisibleOpacity.beginTime = duration
        
        group.animations = [
            startVisibleOpacity,
            onVisibleOpacity,
            endVisibleOpacity
        ]
        
        trafficLight.add(group, forKey: "group")
    }

}
