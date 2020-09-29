//
//  Presentor.swift
//  WeatherAppUsingViper
//
//  Created by Niraj Paul on 28/09/20.
//  Copyright © 2020 Niraj Paul. All rights reserved.
//

import Foundation

protocol PresentorProtocol {
    func getDatFromPresentor(weather:MediaListingBO)
}
class Presentor {
    var presentorDelegate: PresentorProtocol?
    var interactor: Interactor?
    func getDataFromInteractor(){
        interactor?.getItDatafromExternalSource()
    }
}

extension Presentor:InteractorProtocol{
    func getDataFromInteractor(weather: MediaListingBO) {
        self.presentorDelegate?.getDatFromPresentor(weather: weather)
    }
}
