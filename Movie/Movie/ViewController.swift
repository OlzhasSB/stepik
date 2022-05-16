//
//  ViewController.swift
//  Movie
//
//  Created by Olzhas Seiilkhanov on 16.05.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myTableView: UITableView!
    
    var reviewers: [Review] = [
        Review.init(reviewerName: "Wasya", reviewerComment: "Love this movie😎", reviewDate: "05.05.2022"),
        Review.init(reviewerName: "Pupkin", reviewerComment: "Great movie!!!", reviewDate: "05.05.2022"),
        Review.init(reviewerName: "Wasya", reviewerComment: "Love this movie😎", reviewDate: "05.05.2022"),
        Review.init(reviewerName: "Pupkin", reviewerComment: "Great movie!!!", reviewDate: "05.05.2022"),
        Review.init(reviewerName: "Wasya", reviewerComment: "Love this movie😎", reviewDate: "05.05.2022"),
        Review.init(reviewerName: "Pupkin", reviewerComment: "Great movie!!!", reviewDate: "05.05.2022"),
        Review.init(reviewerName: "Wasya", reviewerComment: "Love this movie😎", reviewDate: "05.05.2022"),
        Review.init(reviewerName: "Pupkin", reviewerComment: "Great movie!!!", reviewDate: "05.05.2022"),
        Review.init(reviewerName: "Wasya", reviewerComment: "Love this movie😎", reviewDate: "05.05.2022"),
        Review.init(reviewerName: "Pupkin", reviewerComment: "Great movie!!!", reviewDate: "05.05.2022"),
        Review.init(reviewerName: "Wasya", reviewerComment: "Love this movie😎", reviewDate: "05.05.2022"),
        Review.init(reviewerName: "Pupkin", reviewerComment: "Great movie!!!", reviewDate: "05.05.2022")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! ReviewCell
        cell.dateLabel.text = reviewers[indexPath.row].reviewDate
        cell.reviewerCommentLabel.text = reviewers[indexPath.row].reviewerComment
        cell.reviewerNameLabel.text = reviewers[indexPath.row].reviewerName
        
        return cell
    }
}

