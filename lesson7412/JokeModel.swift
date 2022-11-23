//
//  JokeModel.swift
//  lesson7412
//
//  Created by ake11a on 2022-11-23.
//

import Foundation

class JokeModel {
    
    private weak var controller: JokeController!
    
    private var networkManager = NetworkManager()
    
    init(controller: JokeController!) {
        self.controller = controller
    }
        
    func getJokes() {
        networkManager.getJokes() { jokes in
            self.controller.setJokes(jokes: jokes)
            self.controller.updateData()
        }
    }
}

struct Joke: Codable {
    var setup: String
    var punchline: String
}
