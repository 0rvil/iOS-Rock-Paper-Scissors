//
//  ViewController.swift
//  RPS
//
//  Created by student on 10/28/20.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var result: UITextView!
    @IBOutlet var cpu_choice_img: UIImageView!
    @IBOutlet var user_choice_img: UIImageView!

    @IBOutlet var levelText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressBar.setProgress(0.0, animated: false)
        UserDefaults.standard.register(defaults:["level":1])
        let level = UserDefaults.standard.integer(forKey: "level")
        levelText.text = "Lvl. \(level)"
    }

    @IBAction func rock_btn(_ sender: Any) {
        user_choice_img.image = UIImage(named: "rock_alt")
        let cpu_img = cpu_choice()
        cpu_choice_img.image = UIImage(named: cpu_img)
        result.text = winner(cpu: cpu_img, user: "rock")
        
    }
    @IBAction func paper_btn(_ sender: Any) {
        user_choice_img.image = UIImage(named: "paper_alt")
        let cpu_img = cpu_choice()
        cpu_choice_img.image = UIImage(named: cpu_img)
        result.text = winner(cpu: cpu_img, user: "paper")
    }
    @IBAction func scissors_btn(_ sender: Any) {
        user_choice_img.image = UIImage(named: "scissors_alt")
        let cpu_img = cpu_choice()
        cpu_choice_img.image = UIImage(named: cpu_img)
        result.text = winner(cpu: cpu_img, user: "scissors")
    }
    
    func cpu_choice() -> String {
        // Select a random num and translate to choice
        let rand = Int.random(in: 1...3)
        if(rand == 1){
            return "rock"
        } else if (rand == 2){
            return "paper"
        }
        return "scissors"
    }
    
    func winner(cpu: String, user: String) -> String {
        // Calculate who won the match
        if(cpu == user){
            return "It's a tie"
        } else if ((cpu == "rock" && user == "scissors") || (cpu == "paper" && user == "rock") || (cpu == "scissors" && user == "paper")){
            return "CPU wins"
        }
        // Increase progress bar view
        let newProgress = progressBar.progress + 0.2
        progressBar.setProgress(newProgress, animated: true)
        
        if(newProgress == 1.0){
            let level = UserDefaults.standard.integer(forKey: "level") + 1
            UserDefaults.standard.set(level, forKey: "level")
            levelText.text = "Lvl. \(level)"
            progressBar.setProgress(0.0, animated: false)
        }
        return "You win"
    }
    
}
