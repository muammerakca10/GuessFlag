//
//  ViewController.swift
//  GuessFlag
//
//  Created by MAC on 31.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    
    @IBOutlet var button2: UIButton!
    
    @IBOutlet var button3: UIButton!
    
    var totalQuestion = 0
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    let scoreLabel = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let navigationBar = self.navigationController?.navigationBar {
            
            let scoreFrame = CGRect(x: navigationBar.frame.width / 1.5 , y: navigationBar.frame.height / 2, width: navigationBar.frame.width / 3, height: navigationBar.frame.height / 2)
            scoreLabel.frame = scoreFrame
            
                scoreLabel.frame = scoreFrame
                scoreLabel.text = "Score: "
                
                navigationBar.addSubview(scoreLabel)
            
            
        }

        
        countries += ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia","spain","uk","us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    
    }
    
    func askQuestion (action : UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
        
        view.backgroundColor = .white
        scoreLabel.text = "Score : \(score)"
        totalQuestion += 1
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        //
        var title:String
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
            view.backgroundColor = .green
        } else {
            title = "Wrong. This is \(countries[sender.tag].uppercased())'s flag"
            score -= 1
            view.backgroundColor = .red
        }
        //Game finished
        if totalQuestion == 10 {
            
            let acFinal = UIAlertController(title: "Game Finished", message: "Your score: \(score)", preferredStyle: .alert)
            acFinal.addAction(UIAlertAction(title: "Play again", style: .default, handler: askQuestion))
            present(acFinal, animated: true)
            score = 0
            totalQuestion = 0
        } else { //Game not finished
            let ac = UIAlertController(title: title, message: "Your score : \(score)", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
    }
    
}

