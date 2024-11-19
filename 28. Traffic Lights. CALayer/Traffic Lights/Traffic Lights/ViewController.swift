//
//  ViewController.swift
//  Traffic Lights
//
//  Created by Алексей Олудин on 10.09.2024.
//

import UIKit

class ViewController: UIViewController {
    private let trafficLightCircleRadius: CGFloat = 70
    private let buttonStartPaddingTop: CGFloat = 140
    
    private lazy var trafficLightRed = CircleView(configuration: CircleViewConfiguration.primary(color: .red, radius: trafficLightCircleRadius))
    private lazy var trafficLightYellow = CircleView(configuration: CircleViewConfiguration.primary(color: .yellow, radius: trafficLightCircleRadius))
    private lazy var trafficLightGreen = CircleView(configuration: CircleViewConfiguration.primary(color: .green, radius: trafficLightCircleRadius))
    
    private lazy var startStopButton = CustomButton(configuration: ButtonConfiguration.primary(title: "Start", action: primary))
    
    private let onLightAlpha: CGFloat = 1
    private let offLightAlpha: CGFloat = 0.5
    private let shortDelay: TimeInterval = 2
    private let longDelay: TimeInterval = 5
    private let duration: TimeInterval = 0.3
    
    private var delay: TimeInterval = 0
    private var redAlpha: CGFloat = 0
    private var yellowAlpha: CGFloat = 0
    private var greenAlpha: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultAnimationProperties()
        setSubview()
        setLayout()
        trafficLightRed.alpha = offLightAlpha
        trafficLightYellow.alpha = offLightAlpha
        trafficLightGreen.alpha = offLightAlpha
    }
    
    private func setDefaultAnimationProperties(){
        delay = shortDelay
        redAlpha = onLightAlpha
        yellowAlpha = offLightAlpha
        greenAlpha = offLightAlpha
    }
    
    private func setSubview(){
        view.addSubview(trafficLightRed)
        view.addSubview(trafficLightYellow)
        view.addSubview(trafficLightGreen)
        view.addSubview(startStopButton)
    }
    
    private func setLayout(){
        
        let lengthBetweenTrafficLightCircles: CGFloat = trafficLightCircleRadius * 2 + trafficLightCircleRadius / 5
        
        NSLayoutConstraint.activate([
            
            trafficLightRed.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            trafficLightRed.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -lengthBetweenTrafficLightCircles),
            trafficLightRed.widthAnchor.constraint(equalToConstant: trafficLightRed.diameter),
            trafficLightRed.heightAnchor.constraint(equalToConstant: trafficLightRed.diameter),
            
            trafficLightYellow.centerXAnchor.constraint(equalTo: trafficLightRed.centerXAnchor),
            trafficLightYellow.centerYAnchor.constraint(equalTo: trafficLightRed.centerYAnchor, constant: lengthBetweenTrafficLightCircles),
            trafficLightYellow.widthAnchor.constraint(equalToConstant: trafficLightYellow.diameter),
            trafficLightYellow.heightAnchor.constraint(equalToConstant: trafficLightYellow.diameter),
            
            trafficLightGreen.centerXAnchor.constraint(equalTo: trafficLightYellow.centerXAnchor),
            trafficLightGreen.centerYAnchor.constraint(equalTo: trafficLightYellow.centerYAnchor, constant: lengthBetweenTrafficLightCircles),
            trafficLightGreen.widthAnchor.constraint(equalToConstant: trafficLightGreen.diameter),
            trafficLightGreen.heightAnchor.constraint(equalToConstant: trafficLightGreen.diameter),
            
            startStopButton.centerXAnchor.constraint(equalTo: trafficLightGreen.centerXAnchor),
            startStopButton.centerYAnchor.constraint(equalTo: trafficLightGreen.centerYAnchor, constant: buttonStartPaddingTop)
        ])
    }
    
    
    private func primary() {
        print("This is action from PRIMARY button")
        startStopButton.isStarted.toggle()
        startStopButton.setTitle(startStopButton.isStarted ? "Pause" : "Start", for: .normal)
        (self.redAlpha, self.yellowAlpha, self.greenAlpha) = trafficLight(
            delay: self.delay,
            redAlpha: self.redAlpha,
            yellowAlpha: self.yellowAlpha,
            greenAlpha: self.greenAlpha
        )
    }
 

    
    private func trafficLight(delay: TimeInterval, redAlpha: CGFloat, yellowAlpha: CGFloat, greenAlpha: CGFloat) -> ( CGFloat, CGFloat, CGFloat ){
        guard startStopButton.isStarted else {
            self.trafficLightRed.alpha = redAlpha
            self.trafficLightYellow.alpha = yellowAlpha
            self.trafficLightGreen.alpha = greenAlpha
            return ( redAlpha, yellowAlpha, greenAlpha )
        }
        
        UIView.animate(
            withDuration: self.duration,
            delay: delay,
            options: [.curveEaseOut],
            animations: {
                self.trafficLightRed.alpha = redAlpha
                self.trafficLightYellow.alpha = yellowAlpha
                self.trafficLightGreen.alpha = greenAlpha
            },
            completion: { _ in
                guard self.startStopButton.isStarted else { return }
                
                if greenAlpha == self.offLightAlpha && yellowAlpha == self.offLightAlpha && redAlpha == self.offLightAlpha {
                    (self.redAlpha, self.yellowAlpha, self.greenAlpha) = self.trafficLight(
                        delay: self.longDelay,
                        redAlpha: self.onLightAlpha,
                        yellowAlpha: yellowAlpha,
                        greenAlpha: greenAlpha
                    )
                } else if greenAlpha == self.onLightAlpha {
                    (self.redAlpha, self.yellowAlpha, self.greenAlpha) = self.trafficLight(
                        delay: self.shortDelay,
                        redAlpha: self.offLightAlpha,
                        yellowAlpha: self.offLightAlpha,
                        greenAlpha: self.offLightAlpha
                    )
                } else {
                    (self.redAlpha, self.yellowAlpha, self.greenAlpha) = self.trafficLight(
                        delay: self.shortDelay,
                        redAlpha: greenAlpha,
                        yellowAlpha: redAlpha,
                        greenAlpha: yellowAlpha
                    )
                }
            }
        )
        
        return ( redAlpha, yellowAlpha, greenAlpha )
    }

}
