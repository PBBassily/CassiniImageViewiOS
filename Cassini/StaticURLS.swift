//
//  StaticURLS.swift
//  Cassini
//
//  Created by Paula Boules on 9/12/18.
//  Copyright © 2018 Paula Boules. All rights reserved.
//

import Foundation
class StaticURLS {
    static let stanford = Bundle.main.url(forResource: "oval", withExtension: "jpg")
    
    static var NASA: Dictionary<String,URL> = {
        let NASAURLStrings = [
            "cassini" : "https://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
            "earth" : "https://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
            "saturn" : "https://www.nasa.gov/sites/default/files/saturn_collage.jpg"
        ]
        var urls = Dictionary<String,URL>()
        for (key, value) in NASAURLStrings {
            urls[key] = URL(string: value)
        }
        return urls
    }()
}
