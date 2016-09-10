//
//  ViewController.swift
//  NowPlaying
//
//  Created by Kylie Tram Le on 9/10/16.
//  Copyright © 2016 Kylie Tram Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell", forIndexPath: indexPath) as! MovieCell
        cell.moviePosterImageView.image = UIImage(named: "suicidesquad")
        cell.movieTitleLabel.text = "Suicide Squad"
        
        return cell
    }

}

