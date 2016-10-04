//
//  ViewController.swift
//  NowPlaying
//
//  Created by Kylie Tram Le on 9/10/16.
//  Copyright © 2016 Kylie Tram Le. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift
import Realm

let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
let realmObject = try! Realm()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var movies: [Movie]? = []   // array of movie objects
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // location of Realm DB
        print(Realm.Configuration.defaultConfiguration.description)
        
        let dbMovies = realmObject.objects(Movie.self)  // grab movies from Realm DB
        
        if dbMovies.count > 0 {
            print("Found movies in DB")
            var newMoviesArray = [Movie]()
            for movie in dbMovies {
                newMoviesArray.append(movie)
            }
            movies = newMoviesArray
        } else {
            //make API call and save data in the realm db
            makeAPICall()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies!.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell", forIndexPath: indexPath) as! MovieCell
        cell.movie = movies![indexPath.row]
        cell.selectionStyle = UITableViewCellSelectionStyle.None

        return cell
    }
    
    func makeAPICall() {
        Alamofire.request(.GET, "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)").responseJSON { response in
            if let json = response.result.value {
                if let status_code = json["status_code"] as? Int {  // status_code only if error
                    print("ERROR: Unable to hit the API with status code: \(status_code)")
                    print("Got status message: \(json["status_message"] as! String)")
                }
                else {
                    print("Connection to API successful!")
                    self.movies = Movie.convertMovies((json["results"] as? [NSDictionary])!)
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPathForCell(cell)    // narrow down which movie is clicked
        let movie = movies![indexPath!.row]
        
        let movieController = segue.destinationViewController as! MovieDetailController
        
        movieController.movie = movie
    }
}

