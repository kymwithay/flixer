//
//  DetailViewController.swift
//  flix_codePath
//
//  Created by Kymberlee Hill on 9/6/18.
//  Copyright © 2018 Kymberlee Hill. All rights reserved.
//

import UIKit

enum MovieKeys {
    static let title = "title"
    static let backdropPath = "backdrop_path"
    static let posterPath = "poster_path"
}

class DetailViewController: UIViewController {

    // MARK - Outlets
    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieTitleReleaseDate: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    
    // MARK - Variables
    var movie: [String : Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie {
            movieTitleLabel.text = movie[MovieKeys.title] as? String
            movieTitleReleaseDate.text = movie["release_date"] as? String
            movieOverviewLabel.text = movie["overview"] as? String
            let backdropPathString = movie[MovieKeys.backdropPath] as! String
            let posterPathString = movie[MovieKeys.posterPath] as! String
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            
            let backdropURL = URL(string: baseURLString + backdropPathString)!
            backDropImageView.af_setImage(withURL: backdropURL)
            
            let posterPathURL = URL(string: baseURLString + posterPathString)!
            posterImageView.af_setImage(withURL: posterPathURL)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
