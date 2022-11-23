//
//  NetworkManager.swift
//  lesson7412
//
//  Created by ake11a on 2022-11-23.
//

import Foundation

class NetworkManager {
    func getJokes(completion: @escaping ([Joke]) -> ())  {
        let url = URL(string: "https://official-joke-api.appspot.com/random_ten")
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            DispatchQueue.main.async{
                guard let data = data,
                      let response = try? JSONDecoder().decode([Joke].self, from: data) else {
                    completion([])
                    return
                }
                completion(response)
            }
        }
        task.resume()
    }
}
