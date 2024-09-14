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
    let quiz = [["3 ile 4 toplamı 7 dir." , "True"] ,
                ["2 ile 4 toplamı 6 dir." , "True"] ,
                ["1 ile 3 toplamı 8 dir." , "False"]
    ]
    var questionNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        falseButtonOut.layer.cornerRadius = 8
        trueButtonOut.layer.cornerRadius = 8
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard let answer = sender.titleLabel?.text else {return}
        let trueAnswer = quiz[questionNumber][1]
        if answer == trueAnswer {
            print("the answer is true")
        } else {
            print("the answer is wrong !")
        }
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        updateUI()
    }
    
    func updateUI() {
        questionLabel.text = quiz[questionNumber][0]
    }
    
}

