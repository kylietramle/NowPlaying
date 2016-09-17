//
//  MovieDetailController.swift
//  NowPlaying
//
//  Created by Kylie Tram Le on 9/17/16.
//  Copyright © 2016 Kylie Tram Le. All rights reserved.
//

import UIKit

class MovieDetailController: UIViewController {

    @IBOutlet weak var movieBackDrop: UIImageView!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.movieTitle.text = movie?.movieTitle
        self.movieDescription.text = movie?.moviewOverview
        
        if(movie?.moviewBackdropPathUrl != nil) {
            movieBackDrop.af_setImageWithURL(movie!.moviewBackdropPathUrl!)
        }
    }
    


}
