//
//  Router.swift
//  WeatherAppUsingViper
//
//  Created by Niraj Paul on 28/09/20.
//  Copyright © 2020 Niraj Paul. All rights reserved.
//

import Foundation
//
//  Router.swift
//  ViperArchi
//
//  Created by Niraj Paul on 28/09/20.
//  Copyright © 2020 Niraj Paul. All rights reserved.
//

import Foundation
import UIKit
class Router{
  
  //class function so that we can call it without creating object of router class
  class func getRootScreen() -> UIViewController{
    
    //get storyboard object
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    //get vc object from storyboard based on identifier
    let vc = storyboard.instantiateViewController(withIdentifier: "AlbumList") as! AlbumList
    
    //init presenter
    let presenter = setUpPresenter(forViewController: vc)
    
    
    //init interactor
    setUpInteractor(forPresenter: presenter)
    
    //init view controller's presenter object
    vc.presentor = presenter
    
    //finally return vc
    return vc
  }
  
  private class func setUpPresenter(forViewController vc : AlbumList) -> Presentor{
  
    //init presenter
    let presenter = Presentor()
    //vc will implement presenter's protocol functions
    presenter.presentorDelegate = vc
    return presenter
  }
  
  private class func setUpInteractor(forPresenter presenter : Presentor){
    
    //init interactor
    let interactor = Interactor()
    //presenter will implement interactor protocol functions
    interactor.interactorDelegate = presenter
    
    //presenter's interactor must be initialized
    presenter.interactor = interactor
  }
  
}
