//
//  ViewController.swift
//  ChaparalaJEngagement02
//
//  Created by Chaparala,Jyothsna on 3/17/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let safeArea = view.safeAreaLayoutGuide.layoutFrame

        let x = view.safeAreaLayoutGuide.layoutFrame.minX
        let y = view.safeAreaLayoutGuide.layoutFrame.midY/2
        let diameter = safeArea.width
        let circlePath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: diameter, height: diameter))
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.blue.cgColor
        circleLayer.position = CGPoint(x: x, y: y)
        view.layer.addSublayer(circleLayer)
        
        let firstP = UIBezierPath()
        firstP.move(to: CGPoint(x: (diameter/2) - 25, y: y + 5))
        firstP.addLine(to: CGPoint(x: (diameter/2) - 5, y: y + 5))
        firstP.addLine(to: CGPoint(x: (diameter/2) - 5, y: y - 15))
        firstP.addQuadCurve(to: CGPoint(x: (diameter/2) - 25, y: y - 60), controlPoint: CGPoint(x: (diameter/2) - 25 + 100, y: y - 40))
        firstP.addLine(to: CGPoint(x: (diameter/2) - 25, y: y + 5))
        firstP.close()
        let firstPLayer = CAShapeLayer()
        firstPLayer.path = firstP.cgPath
        firstPLayer.fillColor = UIColor.white.cgColor
        
        let secondP = UIBezierPath()
        secondP.move(to: CGPoint(x: (diameter/2) - 2, y: y + 13))
        secondP.addLine(to: CGPoint(x: (diameter/2) + 18, y: y + 12))
        secondP.addLine(to: CGPoint(x: (diameter/2) + 18, y: y - 10))
        secondP.addQuadCurve(to: CGPoint(x: (diameter/2) - 2, y: y - 55), controlPoint: CGPoint(x: (diameter/2) - 2 + 75, y: y - 30))
        secondP.addLine(to: CGPoint(x: (diameter/2) - 2, y: y + 12))
        secondP.close()
        let secondPLayer = CAShapeLayer()
        secondPLayer.path = secondP.cgPath
        secondPLayer.fillColor = UIColor.green.cgColor
        circleLayer.addSublayer(secondPLayer)
        circleLayer.addSublayer(firstPLayer)
        
        
    }

}
