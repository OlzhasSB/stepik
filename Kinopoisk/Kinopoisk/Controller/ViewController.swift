//
//  ViewController.swift
//  Kinopoisk
//
//  Created by Olzhas Seiilkhanov on 16.05.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myTableView: UITableView!
    var movies: [Movies] = [
        Movies.init(label: "Sonic the Hedgehog", date: "2021-03-03", rating: "★8.7", image: UIImage.init(named: "sonic.jpeg")),
        Movies.init(label: "The Batman", date: "2022-03-01", rating: "★7.5", image: UIImage.init(named: "batman.jpeg")),
        Movies.init(label: "The Avengers", date: "2019-02-03", rating: "★7.9", image: UIImage.init(named: "avengers.jpeg"))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Choose the Movie"
        myTableView.delegate = self
        myTableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            
            if indexPath == [0,0] {
                vc.posterImage = UIImage(named: "sonic_cover.jpeg")
                vc.movieDetailsText = "The world needed a hero -- it got a hedgehog. Powered with incredible speed, Sonic embraces his new home on Earth -- until he accidentally knocks out the power grid, sparking the attention of uncool evil genius Dr. Robotnik. Now, it's supervillain vs. supersonic in an all-out race across the globe to stop Robotnik from using Sonic's unique power to achieve world domination."
                vc.actors = [
                Cast.init(name: "James Marsden", status: "Acting", image: UIImage(named: "james.jpeg")),
                Cast.init(name: "Jim Carrey", status: "Acting", image: UIImage(named: "jim.jpeg")),
                Cast.init(name: "Ben Schwartz", status: "Acting", image: UIImage(named: "ben.jpeg")),
                Cast.init(name: "Tika Sumpter", status: "Acting", image: UIImage(named: "tika.jpeg")),
                Cast.init(name: "Natasha Rothwell", status: "Acting", image: UIImage(named: "natasha.jpeg"))
            ]
            } else if indexPath == [0,1] {
                vc.posterImage = UIImage(named: "batman_cover.jpeg")
                vc.movieDetailsText = "Batman ventures into Gotham City's underworld when a sadistic killer leaves behind a trail of cryptic clues. As the evidence begins to lead closer to home and the scale of the perpetrator's plans become clear, he must forge new relationships, unmask the culprit and bring justice to the abuse of power and corruption that has long plagued the metropolis."
                vc.actors = [
                Cast.init(name: "Robert Pattinson", status: "Acting", image: UIImage(named: "robert.jpeg")),
                Cast.init(name: "Zoë Kravitz", status: "Acting", image: UIImage(named: "zoe.jpeg")),
                Cast.init(name: "Jeffrey Wright", status: "Acting", image: UIImage(named: "jeffrey.jpeg")),
                Cast.init(name: "Colin Farrell", status: "Acting", image: UIImage(named: "colin.jpeg")),
                Cast.init(name: "Paul Dano", status: "Acting", image: UIImage(named: "paul.jpeg")),
            ]
            } else if indexPath == [0,2] {
                vc.actors = [
                
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
