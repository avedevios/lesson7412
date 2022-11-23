//
//  JokeController.swift
//  lesson7412
//
//  Created by ake11a on 2022-11-23.
//

import Foundation

class JokeController {
    
    public weak var view: ViewController!
    
    private var model: JokeModel?
    
    private var jokes: [Joke] = []
    
    init(view: ViewController) {
        self.view = view
        self.model = JokeModel(controller: self)
    }
    
    func updateData() {
        view.updateLabels()
    }
    
    func setJokes(jokes: [Joke]) {
        self.jokes = jokes
    }
    
    func getJokes() -> [Joke] {
        return jokes
    }
    
    func updateJokes() {
        model?.getJokes()
    }
    
}
