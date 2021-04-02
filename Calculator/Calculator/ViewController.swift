//
//  ViewController.swift
//  Calculator
//
//  Created by Daniela Palova on 2.04.21.
//

import UIKit

class ViewController: UIViewController {
    private var resultLabel: UILabel!
    private var resultNumber: CLongDouble!
    
    private let numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    private let signs = Set(["+", "=", "-", "÷", "×"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCalculatorKeyboard()
    }
        
    private func createButton(_ rect: CGRect, _ colorb: UIColor, _ text: String, _ colort: UIColor) {
        let button = UIButton(frame: rect)
        button.layer.bounds = CGRect(x: rect.minX + 15, y: rect.minY + 15, width: rect.width - 15, height: rect.height - 15)
        button.layer.cornerRadius = 44
        
        button.backgroundColor = colorb
        button.setTitleColor(colort, for: .normal)
        button.setTitle(text, for: .normal)
        button.titleLabel!.font = UIFont(name: "Arial-BoldMT", size: 30)
        view.addSubview(button)
        
        if Int(text) != nil {
            button.addTarget(self, action: #selector(pressedNumber), for: .touchUpInside)
        } else if signs.contains(text) {
            button.addTarget(self, action: #selector(pressedOperation), for: .touchUpInside)
        } else if text == "+/-" {
            button.addTarget(self, action: #selector(changeSign), for: .touchUpInside)
        } else if text == "C" {
            button.addTarget(self, action: #selector(pressedClear), for: .touchUpInside)
        }
    }
    
    private func createCalculatorKeyboard() {
        resultLabel = UILabel()
        resultLabel.text = "0"
        resultLabel.backgroundColor = .black
        resultLabel.textColor = .white
        resultLabel.textAlignment = .right
        resultLabel.font = UIFont(name: "Arial-BoldMT" , size: 50)
        view.addSubview(resultLabel)
        resultNumber = 0
        
        let size: CGFloat = view.frame.width / 4
        view.backgroundColor = .black
        let customOringeColor = UIColor(red: 241 / 255, green: 163 / 255,blue: 59 / 255, alpha: 1)
        let customLightGrayColor = UIColor(red: 165 / 255, green: 165 / 255, blue: 165 / 255, alpha: 1)
        let customDarkGrayColor = UIColor(red: 51 / 255, green: 51 / 255, blue: 51 / 255, alpha: 1)

        // row 1
        var buttonY = view.frame.height - size
        var r = CGRect(x: 0, y: buttonY, width: size * 2, height: size)
        createButton(r, customDarkGrayColor, "0", .white)
        r = CGRect(x: size * 2, y: buttonY, width: size, height: size)
        createButton(r, customDarkGrayColor, ",", .white)
        r = CGRect(x: size * 3, y: buttonY, width: size, height: size)
        createButton(r, customOringeColor, "=", .white)
        
        //row 2
        buttonY -= size
        r = CGRect(x: 0, y: buttonY, width: size, height: size)
        createButton(r, customDarkGrayColor, "1", .white)
        r = CGRect(x: size, y: buttonY, width: size, height: size)
        createButton(r, customDarkGrayColor, "2", .white)
        r = CGRect(x: size * 2, y: buttonY, width: size, height: size)
        createButton(r, customDarkGrayColor, "3", .white)
        r = CGRect(x: size * 3, y: buttonY, width: size, height: size)
        createButton(r, customOringeColor, "+", .white)
        
        //row 3
        buttonY -= size
        r = CGRect(x: 0, y: buttonY, width: size, height: size)
        createButton(r, customDarkGrayColor, "4", .white)
        r = CGRect(x: size, y: buttonY, width: size, height: size)
        createButton(r, customDarkGrayColor, "5", .white)
        r = CGRect(x: size * 2, y: buttonY, width: size, height: size)
        createButton(r, customDarkGrayColor, "6", .white)
        r = CGRect(x: size * 3, y: buttonY, width: size, height: size)
        createButton(r, customOringeColor, "-", .white)
        
        //row 4
        buttonY -= size
        r = CGRect(x: 0, y: buttonY, width: size, height: size)
        createButton(r, customDarkGrayColor, "7", .white)
        r = CGRect(x: size, y: buttonY, width: size, height: size)
        createButton(r, customDarkGrayColor, "8", .white)
        r = CGRect(x: size * 2, y: buttonY, width: size, height: size)
        createButton(r, customDarkGrayColor, "9", .white)
        r = CGRect(x: size * 3, y: buttonY, width: size, height: size)
        createButton(r, customOringeColor, "×", .white)
        
        //row 5
        buttonY -= size
        r = CGRect(x: 0, y: buttonY, width: size, height: size)
        createButton(r, customLightGrayColor, "C", .white)
        r = CGRect(x: size, y: buttonY, width: size, height: size)
        createButton(r, customLightGrayColor, "+/-", .white)
        r = CGRect(x: size * 2, y: buttonY, width: size, height: size)
        createButton(r, customLightGrayColor, "%", .white)
        r = CGRect(x: size * 3, y: buttonY, width: size, height: size)
        createButton(r, customOringeColor, "÷", .white)
        
        resultLabel.frame = CGRect(x: view.frame.minX, y: buttonY - 80, width: view.frame.width - 50, height: 50)
    }
    
    @objc func changeSign(_ sender: UIButton) {
        if resultLabel.text!.first == "-" {
            resultLabel.text!.removeFirst()
        } else {
            resultLabel.text?.insert("-", at: resultLabel.text!.startIndex)
        }
    }
    
    @objc func pressedNumber(_ sender: UIButton) {
        let numStr = sender.titleLabel!
        if Int(numStr.text!) == nil {
            return
        }
        
        if resultLabel.text == "0" {
            if numStr.text! != "0" {
                resultLabel.text = numStr.text
            }
        } else {
            resultLabel.text! += numStr.text!
        }
    }
    
    @objc func pressedClear(_ sender: UIButton) {
        resultLabel.text = "0"
        resultNumber = 0
    }
    
    @objc func pressedOperation(_ sender: UIButton) {
        let labelOperation = sender.titleLabel!
        let operation = labelOperation.text!
    }
}
