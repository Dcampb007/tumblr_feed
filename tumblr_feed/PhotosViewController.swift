//
//  PhotosViewController.swift
//  tumblr_feed
//
//  Created by Andre Campbell on 9/2/18.
//  Copyright © 2018 Andre Campbell. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var tableView: UITableView!
    var posts: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 200
        // Network request snippet
        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                // Get the dictionary from the response key
                let responseDictionary = dataDictionary["response"] as! [String: Any]
                // Store the returned array of dictionaries in our posts property
                self.posts = responseDictionary["posts"] as! [[String: Any]]
            }
        self.tableView.reloadData()
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
       let post = posts[indexPath.row]
        if let photos = post["photos"] as? [[String: Any]] {
            // 1.
            let photo = photos[0]
            // 2.
            let originalSize = photo["original_size"] as! [String: Any]
            // 3.
            cell.urlString = originalSize["url"] as! String
            // 4.
            let url = URL(string: cell.urlString)
            cell.photoImageView.af_setImage(withURL: url!)
        }
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! PhotoCell
        if let indexPath = tableView.indexPath(for: cell) {
            let photosDetailViewController = segue.destination as! PhotosDetailViewController
            photosDetailViewController.photoURL = cell.urlString
        }
        
    }

}
