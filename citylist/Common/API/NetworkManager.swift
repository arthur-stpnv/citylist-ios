//
//  NetworkManager.swift
//  citylist
//
//  Created by Arthur Stepanov on 23/01/2021.
//

import Foundation

class NetworkManager: NSObject {
    
    static let shared = NetworkManager()
    
    // MARK: Base

    func request(url: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let requestUrl = URL(string: url) else {
            completion(nil, nil)
            return
        }
        
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: requestUrl, completionHandler: { data, response, error in
                DispatchQueue.main.async {
                    guard let data = data else {
                        completion(nil, error)
                        return
                    }
                    
                    guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                        completion(nil, error)
                        return
                    }
                    
                    completion(data, nil)
                }
            }).resume()
        }
    }
    
    // MARK: Methods
    
    func loadCities(completion: @escaping ([City]?, Error?) -> Void) {
        request(url: "https://bit.ly/39dwkuk", completion: { data, error in
            guard let data = data else {
                completion(nil, error)
                return
            }
            
            let parsedData = try? JSONDecoder().decode([City].self, from: data)
            completion(parsedData, nil)
        })
    }
    
    func getRating(completion: @escaping (Rating?, Error?) -> Void) {
        request(url: "https://bit.ly/39beec8", completion: { data, error in
            guard let data = data else {
                completion(nil, error)
                return
            }
            
            let parsedData = try? JSONDecoder().decode(Rating.self, from: data)
            completion(parsedData, nil)
        })
    }
    
    func getVisitors(completion: @escaping ([String]?, Error?) -> Void) {
        request(url: "https://bit.ly/367XctC", completion: { data, error in
            guard let data = data else {
                completion(nil, error)
                return
            }
            
            let parsedData = try? JSONDecoder().decode([String].self, from: data)
            completion(parsedData, nil)
        })
    }
    
}
