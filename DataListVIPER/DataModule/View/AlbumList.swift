//
//  ViewController.swift
//  WeatherAppUsingViper
//
//  Created by Niraj Paul on 28/09/20.
//  Copyright © 2020 Niraj Paul. All rights reserved.
//

import UIKit


class AlbumList: UIViewController {
    var presentor: Presentor?
    var httpsUtility: HttpUtility?

    @IBOutlet weak var imgV: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
     var contents: [Content] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        presentor?.getDataFromInteractor()
    }
    
    func showImageAndData(data:[Content]){
        self.imgV.image = UIImage(named: data[0].posterImage)
        self.lblTitle.text = data[0].name
    }
}

extension AlbumList: PresentorProtocol{
    func getDatFromPresentor(weather: MediaListingBO) {
        print(weather.page.title)
         self.lblTitle.text = weather.page.title
        let contents = weather.page.contentItems.content
        for content in contents {
            self.contents.append(content)
        }
        self.showImageAndData(data: self.contents)
    }
}
