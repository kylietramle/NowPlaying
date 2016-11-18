//
//  MovieCell.swift
//  NowPlaying
//
//  Created by Kylie Tram Le on 9/10/16.
//  Copyright © 2016 Kylie Tram Le. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieCell: UITableViewCell {

    
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!

    
    var movie : Movie! {
        // initializing & assigning cell properties
        didSet {
            movieTitleLabel.text = movie.movieTitle
            
            if(movie.moviePosterUrl != nil) {
                moviePosterImageView.af_setImageWithURL(NSURL(string: movie!.moviePosterUrl!)!)
            }
        }
    }
}
