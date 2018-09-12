//
//  ImageViewController.swift
//  Cassini
//
//  Created by Paula Boules on 9/12/18.
//  Copyright © 2018 Paula Boules. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    private var image : UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView.contentSize = imageView.frame.size
        }
    }
    var imageView = UIImageView()
    @IBOutlet weak var scrollView: UIScrollView!
        {
        didSet {
            scrollView.minimumZoomScale = 1/25
            scrollView.maximumZoomScale = 1.0
            scrollView.delegate = self
            scrollView.addSubview(imageView)
        }
    }
    var imageURL : URL? {didSet {
        image = nil
        
        if view.window != nil {
            // i am on screen
            fetchImage()
        }
        }
    }
    
    
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
                image = UIImage(data: urlContents)
               
                
            }
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if imageURL == nil {
            imageURL = StaticURLS.stanford
        }
    }
    func  viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView 
    }
}
