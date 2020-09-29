//
//  Interactor.swift
//  WeatherAppUsingViper
//
//  Created by Niraj Paul on 28/09/20.
//  Copyright © 2020 Niraj Paul. All rights reserved.
//

import Foundation

protocol InteractorProtocol {
    func getDataFromInteractor(weather: MediaListingBO)
}

class Interactor{
    var interactorDelegate: InteractorProtocol?
    
    var httpsUtility: HttpUtility?
    
    func getItDatafromExternalSource(){
        httpsUtility = HttpUtility()
        httpsUtility?.getApiData(fileName: "dataContent", resultType: MediaListingBO.self, completionHandler: { (mediaData) in
            self.interactorDelegate?.getDataFromInteractor(weather: mediaData)
        })
       
    }
}

class GlobalUrlString {
    static let urlString = "https://api.darksky.net/forecast/368cc91f55e9c28e27b8fad63fb395b0/22.5726,88.3639"

}
