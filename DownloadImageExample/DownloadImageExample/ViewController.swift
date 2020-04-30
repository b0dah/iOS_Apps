//
//  ViewController.swift
//  DownloadImageExample
//
//  Created by Иван Романов on 30.04.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    let url = URL(string: "http://IvansMacBookPro.local:8000/static/museum_logos/AfriartGallery.jpg")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        downloadImage(from: url)
    }

    func downloadImage(from url: URL) {
        print("download started")
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            print(response?.suggestedFilename!)
            
            print("download finished")
            
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }.resume()
    }

}

