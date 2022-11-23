//
//  ViewController.swift
//  lesson7412
//
//  Created by ake11a on 2022-11-23.
//

import UIKit

class ViewController: UIViewController {

    private var controller: JokeController!
    
    private lazy var setupLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var punchlineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
       
//        NetworkManager().getJokes { result in
//            //self.randomJoke = result[0]
//
//            self.setupLabel.text = result[randomDigit].setup
//            self.punchlineLabel.text = result[randomDigit].punchline
//        }
        
        self.controller = JokeController(view: self)
        
        controller.updateJokes()
        
        setupSubviews()
    }
    
    func updateLabels() {
        DispatchQueue.main.async {
            let randomDigit = Int.random(in: 0...9)
            
            let jokes = self.controller.getJokes()
            self.setupLabel.text = jokes[randomDigit].setup
            self.punchlineLabel.text = jokes[randomDigit].punchline
        }
    }

    func setupSubviews() {
        view.addSubview(setupLabel)
        let setupLabelTop = setupLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let setupLabelCenterX = setupLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let setupLabelHeight = setupLabel.heightAnchor.constraint(equalToConstant: 300)
        
        view.addSubview(punchlineLabel)
        let punchlineLabelTop = punchlineLabel.topAnchor.constraint(equalTo: setupLabel.bottomAnchor, constant: 20)
        let punchlineLabelCenterX = punchlineLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let punchlineLabelHeight = setupLabel.heightAnchor.constraint(equalToConstant: 200)

        
        NSLayoutConstraint.activate([
            setupLabelTop, setupLabelCenterX, setupLabelHeight,
            punchlineLabelTop, punchlineLabelCenterX, punchlineLabelHeight
        ])
    }
}

