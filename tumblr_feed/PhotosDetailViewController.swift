//
//  PhotosDetailViewController.swift
//  tumblr_feed
//
//  Created by Andre Campbell on 9/9/18.
//  Copyright © 2018 Andre Campbell. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotosDetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var photoURL: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if photoURL != "" {
            let url = URL(string: photoURL)!
            imageView.af_setImage(withURL: url)
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
