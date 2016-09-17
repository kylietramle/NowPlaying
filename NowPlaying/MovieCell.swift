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
        didSet {
            movieTitleLabel.text = movie.movieTitle
            
            if(movie.moviePosterUrl != nil) {
                moviePosterImageView.af_setImageWithURL(movie.moviePosterUrl!)
                print(movie.moviePosterUrl)
            }
            print(movie.moviePosterUrl)
        }
    }
}
