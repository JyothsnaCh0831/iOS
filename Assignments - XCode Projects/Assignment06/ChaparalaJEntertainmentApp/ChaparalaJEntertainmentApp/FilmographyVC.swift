//
//  FilmographyVC.swift
//  ChaparalaJEntertainmentApp
//
//  Created by Chaparala,Jyothsna on 4/14/23.
//

import UIKit

class FilmographyVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var moviesCV: UICollectionView!
    
    var filmPoster: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.moviesCV.delegate = self
        self.moviesCV.dataSource = self
        
        self.moviesCV.collectionViewLayout = self.createLayout()
        
        self.moviesCV.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var data: [String] = []
        if(indexPath.section == 0) {
            for i in 0..<3 {
                data.append(actorsList[self.filmPoster].movies[i])
            }
        } else {
            for i in 3..<6 {
                data.append(actorsList[self.filmPoster].movies[i])
            }
        }
        let cell = self.moviesCV.dequeueReusableCell(withReuseIdentifier: "posters", for: indexPath) as! PosterCVC
        
        cell.posterIV.image = UIImage(named: data[indexPath.row])
        cell.posterIV.layer.cornerRadius = 5.0
        cell.posterIV.layer.masksToBounds = true
        cell.posterIV.layer.borderWidth = 2.0
        cell.posterIV.layer.borderColor = UIColor.black.cgColor
        
        return cell
    }

    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionNumber, _) -> NSCollectionLayoutSection? in
            
            // First item
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                                    widthDimension: .fractionalWidth(1/2),
                                    heightDimension: .fractionalHeight(1)
                )
            )
            item.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 2)
            
            // Item that have to share in group
            let verticalStackItems = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                                    widthDimension: .fractionalWidth(1),
                                    heightDimension: .fractionalHeight(1)
                )
            )
            verticalStackItems.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 2)
            
            // Vertical Group having two items
            let verticalStackGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                                    widthDimension: .fractionalWidth(1/2),
                                    heightDimension: .fractionalHeight(1)
                ),
                subitem: verticalStackItems,
                count: 2
            )
            
            // for each section
            if(sectionNumber == 0) {
                // Groups - Holding one item, two items in one group
                let topGroup = NSCollectionLayoutGroup.horizontal(
                   layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1/2)
                   ),
                   subitems: [
                    item,
                    verticalStackGroup
                   ]
                )
                return NSCollectionLayoutSection(group: topGroup)
            } else {
                // Groups - Holding one item, two items in one group
                let bottomGroup = NSCollectionLayoutGroup.horizontal(
                   layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1/2)
                   ),
                   subitems: [
                    verticalStackGroup,
                    item
                   ]
                )
                return NSCollectionLayoutSection(group: bottomGroup)
            }
        }
        return layout
    }
}
