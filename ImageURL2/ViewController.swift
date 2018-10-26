//
//  ViewController.swift
//  ImageURL2
//
//  Created by Hiếu Nguyễn on 8/11/18.
//  Copyright © 2018 Hiếu Nguyễn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var refreshUI: UIActivityIndicatorView!
    @IBOutlet weak var photoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI.startAnimating()
        loadImageURL(urlString: "https://i.imgur.com/gtEEo3H.jpg")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func loadImageURL(urlString: String) {
        // Kiem tra va Convert URL sang String
        guard let url = URL(string: urlString) else { return}
        DispatchQueue.global().async {
            // Kiem tra va ep image ve kieu du lieu Data
            if let data = try? Data(contentsOf: url) {
                // Gan hinh anh da down vao trong ImageView
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.photoView.image = image
                        self.refreshUI.isHidden = true
                        self.refreshUI.stopAnimating()
                    }
                }
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}







