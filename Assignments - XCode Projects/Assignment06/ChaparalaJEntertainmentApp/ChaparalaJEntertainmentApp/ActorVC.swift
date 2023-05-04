//
//  ActorVC.swift
//  ChaparalaJEntertainmentApp
//
//  Created by Chaparala,Jyothsna on 4/14/23.
//

import UIKit
import ViewAnimator

class ActorVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var actorTableView: UITableView!
    
    var forRating: Int = 0
    var films: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.actorTableView.delegate = self
        self.actorTableView.dataSource = self
        self.actorTableView.register(UINib(nibName: "ActorTVC", bundle: nil), forCellReuseIdentifier: "actors")
        self.actorTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.animateTVC(cells: self.actorTableView.visibleCells)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actorsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.actorTableView.dequeueReusableCell(withIdentifier: "actors", for: indexPath) as! ActorTVC
        cell.actorIV.image = UIImage(named: actorsList[indexPath.row].actorImageName)
        cell.actorNameLBL.text = actorsList[indexPath.row].fullName
        cell.yearsActiveLBL.text = actorsList[indexPath.row].yearsActive
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "List of actors"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.films = indexPath.row
        self.performSegue(withIdentifier: "showFilms", sender: self)
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        self.forRating = indexPath.row
        self.performSegue(withIdentifier: "showRating", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifer = segue.identifier
        
        switch identifer {
        case "showRating":
            let desVC = segue.destination as? ActorRatingVC
            desVC?.actor = self.forRating
        case "showFilms":
            self.actorTableView.deselectRow(at: self.actorTableView.indexPathForSelectedRow!, animated: true)
            let desVC = segue.destination as? FilmographyVC
            desVC?.filmPoster = self.films
        default:
            break
        }
    }
}

extension ActorVC {
    func animateTVC(cells: [UITableViewCell]) {
        let from = AnimationType.from(direction: .bottom, offset: 50.0)
        let zoom = AnimationType.zoom(scale: 1.5)
        UIView.animate(
            views: cells,
            animations: [from, zoom],
            reversed: false,
            initialAlpha: 0.0,
            finalAlpha: 1.0,
            delay: 0.0,
            animationInterval: 0.2,
            duration: 1.0,
            usingSpringWithDamping: ViewAnimatorConfig.springDampingRatio,
            initialSpringVelocity: ViewAnimatorConfig.initialSpringVelocity,
            completion: nil
        )
    }
}
