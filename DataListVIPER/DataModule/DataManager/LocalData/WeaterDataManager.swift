//
//  WeaterDataManager.swift
//  WeatherAppUsingViper
//
//  Created by Niraj Paul on 28/09/20.
//  Copyright © 2020 Niraj Paul. All rights reserved.
//

import Foundation

struct HttpUtility {
    func getApiData<T:Decodable>(fileName: String, resultType: T.Type, completionHandler:(_ result: T)-> Void){
        do {
            let url = Bundle.main.url(forResource: fileName, withExtension: "json")
            if url==nil {
                return
            }
            let data = try Data(contentsOf: url!)
            let response = try JSONDecoder().decode(T.self, from: data)
            _=completionHandler(response)
        }
        catch let decodingError {
            debugPrint(decodingError)
        }
    }
}

