//
//  ImageViewController.swift
//  Cassini
//
//  Created by Paula Boules on 9/12/18.
//  Copyright © 2018 Paula Boules. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    var imageURL : URL? {didSet {
        imageView.image = nil
        
        if view.window != nil {
            // i am on screen
            fetchImage()
        }
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if imageView.image == nil {
            fetchImage()
        }
    }
    
    private func fetchImage(){
        if let url = imageURL {
            // if fails, return nil
            if let urlContents = try? Data(contentsOf: url) {
                imageView.image = UIImage(data: urlContents)
            }
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if imageURL == nil {
            imageURL = StaticURLS.stanford
        }
    }
    
}
