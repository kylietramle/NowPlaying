//
//  MovieDetailController.swift
//  NowPlaying
//
//  Created by Kylie Tram Le on 9/17/16.
//  Copyright © 2016 Kylie Tram Le. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailController: UIViewController {

    @IBOutlet weak var movieBackDrop: UIImageView!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    
    var movie: Movie?       // local movie variable
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 18, g: 114, b: 123)
        
        self.movieTitle.text = movie?.movieTitle
        self.movieDescription.text = movie?.movieOverview
        
        if(movie?.movieBackdropPathUrl != nil) {
            movieBackDrop.af_setImageWithURL(NSURL(string: movie!.movieBackdropPathUrl!)!)
        }
    }
    


}
