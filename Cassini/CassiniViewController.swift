//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Paula Boules on 9/16/18.
//  Copyright © 2018 Paula Boules. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier {
            if let url = StaticURLS.NASA[id] {
                var dest = segue.destination
                if let navcon  = dest as? UINavigationController {
                    dest = navcon.visibleViewController ?? navcon
                }
                if let imageVC = dest as? ImageViewController {
                    imageVC.imageURL = url
                    imageVC.title = (sender as? UIButton)?.currentTitle
                }
            }
        }
    }
}
