//
//  Movie.swift
//  NowPlaying
//
//  Created by Kylie Tram Le on 9/17/16.
//  Copyright © 2016 Kylie Tram Le. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

let baseImageURL = "http://image.tmdb.org/t/p/w500" // for the poster URL

class Movie: Object {
    
    dynamic var moviePosterUrl: String? = nil
    dynamic var movieTitle: String? = nil
    dynamic var movieOverview: String? = nil
    dynamic var movieBackdropPathUrl: String? = nil
    
    // initialize Movie instance
    class func newMovie(movieDictionary: NSDictionary) -> Movie {
        
        let movie = Movie()
        
        if let moviePosterUrlString = movieDictionary["poster_path"] as? String {
            movie.moviePosterUrl = baseImageURL + moviePosterUrlString
        } else {
            movie.moviePosterUrl = nil
        }
        
        if let moviewBackdropPathString = movieDictionary["backdrop_path"] as? String {
            movie.movieBackdropPathUrl = baseImageURL + moviewBackdropPathString
        } else {
            movie.movieBackdropPathUrl = nil
        }
        
        movie.movieTitle = movieDictionary["title"] as? String
        
        movie.movieOverview = movieDictionary["overview"] as? String
        
        return movie
        
    }
    
    // take array of JSON movie objects and turn it to our Movie class objects
    class func convertMovies(jsonArray: [NSDictionary]) -> [Movie] {
        var movies = [Movie]()  // empty movies array that will contain Movie objects
        
        for jsonDictionary in jsonArray {
            let movie = newMovie(jsonDictionary)   // init method
            try! realmObject.write() {
                realmObject.add(movie)
                
                print("New Movie saved with name: \(movie.movieTitle)")
                movies.append(movie)
            }
        }
        return movies
    }
}
