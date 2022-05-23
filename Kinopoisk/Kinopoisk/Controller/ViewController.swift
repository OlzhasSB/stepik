//
//  ViewController.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 16.05.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myTableView: UITableView!
    @IBOutlet var genreCollectionView: UICollectionView!
    
    
    var movies: [Movies] = [
        Movies.init(label: "Sonic the Hedgehog", date: "2020-02-14", rating: "★8.7", image: UIImage.init(named: "sonic.jpeg")),
        Movies.init(label: "The Batman", date: "2022-03-04", rating: "★7.5", image: UIImage.init(named: "batman.jpeg")),
        Movies.init(label: "The Avengers", date: "2018-04-27", rating: "★7.9", image: UIImage.init(named: "avengers.jpeg"))
    ]
    
    var genres: [Genre] = [
        Genre.init(text: "All"),
        Genre.init(text: "Comedy"),
        Genre.init(text: "Action"),
        Genre.init(text: "Drama"),
        Genre.init(text: "Adventure"),
        Genre.init(text: "Sci-fi")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"
        myTableView.delegate = self
        myTableView.dataSource = self
        genreCollectionView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            vc.label = movies[indexPath.row].label
            vc.date = movies[indexPath.row].date
            
            if indexPath.row == 0 {
                vc.posterImage = UIImage(named: "sonic_cover.jpeg")
                vc.movieDetailsText = "The world needed a hero -- it got a hedgehog. Powered with incredible speed, Sonic embraces his new home on Earth -- until he accidentally knocks out the power grid, sparking the attention of uncool evil genius Dr. Robotnik. Now, it's supervillain vs. supersonic in an all-out race across the globe to stop Robotnik from using Sonic's unique power to achieve world domination. The world needed a hero -- it got a hedgehog. Powered with incredible speed, Sonic embraces his new home on Earth -- until he accidentally knocks out the power grid, sparking the attention of uncool evil genius Dr. Robotnik. Now, it's supervillain vs. supersonic in an all-out race across the globe to stop Robotnik from using Sonic's unique power to achieve world domination."
                vc.actors = [
                    Cast.init(name: "James\nMarsden", status: "Acting", image: UIImage(named: "james.jpeg")),
                    Cast.init(name: "Jim\nCarrey", status: "Acting", image: UIImage(named: "jim.jpeg")),
                    Cast.init(name: "Ben\nSchwartz", status: "Acting", image: UIImage(named: "ben.jpeg")),
                    Cast.init(name: "Tika\nSumpter", status: "Acting", image: UIImage(named: "tika.jpeg")),
                    Cast.init(name: "Natasha\nRothwell", status: "Acting", image: UIImage(named: "natasha.jpeg"))
            ]
            } else if indexPath.row == 1 {
                vc.posterImage = UIImage(named: "batman_cover.jpeg")
                vc.movieDetailsText = "Batman ventures into Gotham City's underworld when a sadistic killer leaves behind a trail of cryptic clues. As the evidence begins to lead closer to home and the scale of the perpetrator's plans become clear, he must forge new relationships, unmask the culprit and bring justice to the abuse of power and corruption that has long plagued the metropolis."
                vc.actors = [
                    Cast.init(name: "Robert\nPattinson", status: "Acting", image: UIImage(named: "robert.jpeg")),
                    Cast.init(name: "Zoë\nKravitz", status: "Acting", image: UIImage(named: "zoe.jpeg")),
                    Cast.init(name: "Jeffrey\nWright", status: "Acting", image: UIImage(named: "jeffrey.jpeg")),
                    Cast.init(name: "Colin\nFarrell", status: "Acting", image: UIImage(named: "colin.jpeg")),
                    Cast.init(name: "Paul\nDano", status: "Acting", image: UIImage(named: "paul.jpeg")),
            ]
            } else if indexPath.row == 2 {
                vc.posterImage = UIImage(named: "avengers_cover.jpeg")
                vc.movieDetailsText = "Iron Man, Thor, the Hulk and the rest of the Avengers unite to battle their most powerful enemy yet -- the evil Thanos. On a mission to collect all six Infinity Stones, Thanos plans to use the artifacts to inflict his twisted will on reality. The fate of the planet and existence itself has never been more uncertain as everything the Avengers have fought for has led up to this moment."
                vc.actors = [
                    Cast.init(name: "Robert\nDowney Jr.", status: "Acting", image: UIImage(named: "robertd.jpeg")),
                    Cast.init(name: "Chris\nHemsworth ", status: "Acting", image: UIImage(named: "chris.jpeg")),
                    Cast.init(name: "Josh\nBrolin ", status: "Acting", image: UIImage(named: "josh.jpeg")),
                    Cast.init(name: "Chadwick\nBoseman ", status: "Acting", image: UIImage(named: "chadwick.jpeg")),
                    Cast.init(name: "Mark\nRuffalo ", status: "Acting", image: UIImage(named: "mark.jpeg"))
                ]
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MovieCell
        cell.setUp(with: movies[indexPath.row])
        
        return cell
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genreCell", for: indexPath) as! GenreCell
        cell.setUp(with: genres[indexPath.row])
        
        return cell
    }
}










//    @IBAction func goToButton(_ sender: UIButton) {
//        self.performSegue(withIdentifier: "goToCast", sender: self)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinationVC = segue.destination as! SecondViewController
//        destinationVC.actors = [
//            Cast.init(name: "James Marsden", status: "Acting", image: UIImage(named: "james.jpeg")),
//            Cast.init(name: "Jim Carrey", status: "Acting", image: UIImage(named: "jim.jpeg")),
//            Cast.init(name: "Ben Schwartz", status: "Acting", image: UIImage(named: "ben.jpeg")),
//            Cast.init(name: "Tika Sumpter", status: "Acting", image: UIImage(named: "tika.jpeg")),
//            Cast.init(name: "Natasha Rothwell", status: "Acting", image: UIImage(named: "natasha.jpeg")),
//        ]
//    }
