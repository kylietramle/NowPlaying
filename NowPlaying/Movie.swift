//
//  Movie.swift
//  NowPlaying
//
//  Created by Kylie Tram Le on 9/17/16.
//  Copyright © 2016 Kylie Tram Le. All rights reserved.
//

import UIKit

let baseImageURL = "http://image.tmdb.org/t/p/w500"

class Movie: NSObject {
    
    var moviePosterUrl: NSURL?
    var movieTitle: String?
    var moviewOverview: String?
    var moviewBackdropPathUrl: NSURL?
    
    init(dictionary: NSDictionary) {
        
        if let moviePosterUrlString = dictionary["poster_path"] as? String {
            moviePosterUrl = NSURL(string: baseImageURL + moviePosterUrlString)!
        } else {
            moviePosterUrl = nil
        }
        
        if let moviewBackdropPathString = dictionary["backdrop_path"] as? String {
            moviewBackdropPathUrl = NSURL(string: baseImageURL + moviewBackdropPathString)!
        } else {
            moviewBackdropPathUrl = nil
        }
        
        self.movieTitle = dictionary["title"] as? String
        
        self.moviewOverview = dictionary["overview"] as? String
        
    }
    
    class func movies(array: [NSDictionary]) -> [Movie] {
        var movies = [Movie]()
        for dictionary in array {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        return movies
    }
}
