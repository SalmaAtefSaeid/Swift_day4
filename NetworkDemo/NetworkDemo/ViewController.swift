//
//  ViewController.swift
//  NetworkDemo
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var img: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var releaseLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    var movie : Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        titleLabel.text = movie?.title
        ratingLabel.text = String((movie?.rating)!)
        releaseLabel.text = String((movie?.releaseYear)!)
        var genre = (movie?.genre)?.joined(separator: ",")
        genreLabel.text = genre
        let url = URL (string: (movie?.image)!)
        let request = URLRequest (url: url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) { (data, responce, error) in
            do{
                DispatchQueue.main.async {
                    self.img.image = UIImage(data: data!)
                }
            }catch{
                print("Error")
            }
            }.resume()
    }


}

