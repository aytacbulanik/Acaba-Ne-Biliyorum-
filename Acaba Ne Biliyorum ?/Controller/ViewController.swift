//
//  ViewController.swift
//  Acaba Ne Biliyorum ?
//
//  Created by Aytaç Bulanık on 14.09.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choseeOneButtonOut: UIButton!
    @IBOutlet weak var choseeTwoButtonOut: UIButton!
    @IBOutlet weak var choseeThreeButtonOut: UIButton!
    @IBOutlet weak var progressViewOut: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var questionManager = QuestionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        choseeOneButtonOut.layer.cornerRadius = 8
        choseeThreeButtonOut.layer.cornerRadius = 8
        choseeTwoButtonOut.layer.cornerRadius = 8
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard let answer = sender.titleLabel?.text else {return}
        let controlAnswer = questionManager.checkAnswer(answer)
        if controlAnswer {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }

        updateUI()
    }
    
    func updateUI() {
            questionLabel.text = questionManager.sendNewQuestion()
            scoreLabel.text = "Score : \(questionManager.getScore())"
            progressViewOut.progress = questionManager.progressManager()
            var chosees = questionManager.sendChosees()
            chosees = chosees.shuffled()
            choseeOneButtonOut.titleLabel?.text = chosees[0]
            choseeTwoButtonOut.titleLabel?.text = chosees[1]
            choseeThreeButtonOut.titleLabel?.text = chosees[2]
        print(chosees)
    }
    
}

