//
//  ViewController.swift
//  Bullseye
//
//  Created by Guest account on 3/14/22.
//  Copyright © 2022 com.timnazar. All rights reserved.
//

import UIKit
//
class MainBoardViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    
    
    var guessingNumber: Int = Int.random(in: 1...100)
    // chislo kotoroe nado ugadat
    
    var round: Int = 1
    
    var score: Int = 0
    // obshee kolichestvo ochkov igroka
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
   
        let normalThumbImage = UIImage(named: "SliderThumb-Normal")
        let hihglightedThumbImage = UIImage(named: "SliderThumb-Highlighted")
        
        slider.setThumbImage(normalThumbImage, for: .normal)
        slider.setThumbImage(hihglightedThumbImage, for: .highlighted)
    }

    @IBAction func didTapSelectButton(_ sender: Any) {

        //  esli igra tolko nachinaetsya
        
        round = round + 1
        roundLabel.text = ("раунд: \(round)")
    
        
               
        
        
            //zadacha
        // 1prochitat chisla is slidera
        let sliderValue: Float = slider.value
        // 2 perevesti eto chislo v int
        let sliderValueInt: Int = Int(sliderValue)
        // 3 sravnit dva chisla i esli oni sovpadayut , to vivesti  v konsol informaciyu ob etom
        let isValueEquals = sliderValueInt == guessingNumber
        if isValueEquals {
            print("вы угадали число")
            score = score + 1
            scoreLabel.text = String("очки: \(score)")
        }else {
            print("вы выбрали число  \(sliderValueInt)")
        
        }
        
        updateGuessingNumber()
    
       
    }

    @IBAction func didTapTryAgain(_ sender: Any) {
        print("попробуйте еще раз")
        setUp()
    }
    
    // nazvanie funkcii
    func setUp() {
        // nstroika nachala igri
            
        // 1. ustanavlivaem znacheine slidera na 50
        slider.value = 50
           
        //2. zadat chislo kotoroe budut ugadivat
        updateGuessingNumber()
        
        // 3. obnulit ochki
        score = 0
        scoreLabel.text = "очки:" + String(score)
        
               
    }
    func updateGuessingNumber() {
        guessingNumber = Int.random(in: 1...100 )
        taskLabel.text = "попробуйте угадать число: " + String(guessingNumber )
}
}
