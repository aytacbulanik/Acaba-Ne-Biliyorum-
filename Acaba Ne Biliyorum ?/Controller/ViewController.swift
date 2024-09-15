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
    
    var questionManager = QuestionManager(questionNumber: 0, score: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        choseeOneButtonOut.layer.cornerRadius = 8
        choseeThreeButtonOut.layer.cornerRadius = 8
        choseeTwoButtonOut.layer.cornerRadius = 8
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let chosee = questionManager.sendFirstQuestion()
        let answer = chosee.0
        questionLabel.text = answer
        var answerC = chosee.1
        answerC = answerC.shuffled()
        choseeOneButtonOut.setTitle(answerC[0], for: .normal)
        choseeTwoButtonOut.setTitle(answerC[1], for: .normal)
        choseeThreeButtonOut.setTitle(answerC[2], for: .normal)
        print(progressViewOut.progress)
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard let answer = sender.currentTitle else {return}
        let controlAnswer = questionManager.checkAnswer(answer)
        if controlAnswer {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        updateUI(button: sender)
    }
    
    func updateUI(button : UIButton) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { [self] in
            questionLabel.text = questionManager.sendNewQuestion()
            scoreLabel.text = "Score : \(questionManager.getScore())"
            progressViewOut.progress = questionManager.progressManager()
            var chosees = questionManager.sendChosees()
            chosees = chosees.shuffled()
            choseeOneButtonOut.setTitle(chosees[0], for: .normal)
            choseeTwoButtonOut.setTitle(chosees[1], for: .normal)
            choseeThreeButtonOut.setTitle(chosees[2], for: .normal)
            button.backgroundColor = .systemGray
        }
    }
    
}

