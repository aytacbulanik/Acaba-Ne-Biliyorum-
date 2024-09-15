//
//  ViewController.swift
//  Acaba Ne Biliyorum ?
//
//  Created by Aytaç Bulanık on 14.09.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButtonOut: UIButton!
    @IBOutlet weak var falseButtonOut: UIButton!
    @IBOutlet weak var progressViewOut: UIProgressView!
    
    var questionManager = QuestionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questionManager.senFirstQuestion()
        falseButtonOut.layer.cornerRadius = 8
        trueButtonOut.layer.cornerRadius = 8
        progressViewOut.progress = 0.0
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard let answer = sender.titleLabel?.text else {return}
        let controlAnswer = questionManager.checkAnswer(answer)
        if controlAnswer {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
     
        updateUI(button: sender)
    }
    
    func updateUI(button : UIButton) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
            button.backgroundColor = .systemGray
            self.questionLabel.text = questionManager.sendNewQuestion()
            progressViewOut.progress = questionManager.progressManager()
        }
    }
    
}

