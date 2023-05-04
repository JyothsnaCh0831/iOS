//
//  ViewController.swift
//  ChaparalaJGalleryApp
//
//  Created by Chaparala,Jyothsna on 3/6/23.
//

import UIKit

class GalleryVC: UIViewController {
    
    var index : Int = 0
    var categoryObjects : Dictionary<String, Category> = [:]
    var category : Category =  Category(with: [], pictures: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.enableAndDisable(basedOn: false)
        createCategoryObj()
        
    }
    
    @IBOutlet weak var searchTF: UITextField!
    
    @IBOutlet weak var commentTF: UITextField!
    
    @IBOutlet weak var pictureIV: UIImageView!{
        didSet {
            self.pictureIV.isUserInteractionEnabled = true
            
            let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(moveToLeft(_ :)))
            leftSwipe.direction = .left
            self.pictureIV.addGestureRecognizer(leftSwipe)
            
            let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(moveToRight(_ :)))
            rightSwipe.direction = .right
            self.pictureIV.addGestureRecognizer(rightSwipe)
            
            let tripleTap = UITapGestureRecognizer(target: self, action: #selector(onTripleTap(_ :)))
            tripleTap.numberOfTapsRequired = 3
            self.pictureIV.addGestureRecognizer(tripleTap)
            
            let doubleTap = UITapGestureRecognizer(target: self, action: #selector(onDoubleTap(_ :)))
            doubleTap.require(toFail: tripleTap)
            doubleTap.numberOfTapsRequired = 2
            self.pictureIV.addGestureRecognizer(doubleTap)
            
        }
        
    }
    
    @IBOutlet weak var pictureCommentsTV: UITextView!
    
    @IBOutlet weak var searchBTN: UIButton!
    
    @IBOutlet weak var likeBTN: UIButton!
    
    @IBOutlet weak var dislikeBTN: UIButton!
    
    @IBOutlet weak var saveBTN: UIButton!
    
    @IBOutlet weak var resetBTN: UIButton!
    
    @IBAction func searchTF(_ sender: UITextField) {
        self.searchBTN.isEnabled = true
    }
    
    @IBAction func search(_ sender: UIButton) {
        guard let value = self.searchTF, let searchedText = value.text else {
            return
        }
        index = 0
        var flag : Bool = false
        
        switch true {
            case AppConstants.cityKeywords.contains(searchedText):
                category = categoryObjects["cities"]!
            case AppConstants.shoesKeywords.contains(searchedText):
                category = categoryObjects["shoes"]!
            case AppConstants.disneyMoviesKeywords.contains(searchedText):
                category = categoryObjects["movies"]!
            case AppConstants.wristWatchesKeywords.contains(searchedText):
                category = categoryObjects["watches"]!
            case AppConstants.festivalsKeywords.contains(searchedText):
                category = categoryObjects["festivals"]!
            default:
                flag = true
                self.pictureIV.image = UIImage(systemName: "folder")
                self.enableAndDisable(basedOn: false)
                self.likeBTN.setTitle("👍", for: .normal)
                self.dislikeBTN.setTitle("👎", for: .normal)
                self.pictureCommentsTV.text = "Sorry! No pictures found for the search. Try again with a different searhc keyword."
        }
        
        if(flag == false) {
            self.enableAndDisable(basedOn: true)
            self.pictureIV.image = UIImage(named: category.pictures[index].name)
            self.display(using: index)
            
        }
        
    }
    
    
    
    @IBAction func save(_ sender: UIButton) {
        guard let value = self.commentTF, let text = value.text else {
            return
        }
        
        category.pictures[index].comments.append(text)
        
        self.commentTF.text = ""
        self.pictureCommentsTV.text = "Comments:\n"
        var temp = 1
        for c in category.pictures[index].comments {
            self.pictureCommentsTV.text! += (String(temp) + ". " + c + "\n")
            temp += 1
        }
        
        
    }
    
    @IBAction func reset(_ sender: UIButton) {
        self.pictureIV.image = UIImage(systemName: "folder")
        self.enableAndDisable(basedOn: false)
        self.searchTF.text = ""
        self.likeBTN.setTitle("👍", for: .normal)
        self.dislikeBTN.setTitle("👎", for: .normal)
        self.pictureCommentsTV.text = ""
        
    }
    
    private func enableAndDisable(basedOn flag: Bool) {
        if(flag == false) {
            self.commentTF.isEnabled = false
            self.pictureCommentsTV.isEditable = false
            self.searchBTN.isEnabled = false
            self.likeBTN.isEnabled = false
            self.dislikeBTN.isEnabled = false
            self.saveBTN.isEnabled = false
            self.resetBTN.isEnabled = false
        } else {
            self.commentTF.isEnabled = true
            self.pictureCommentsTV.isEditable = true
            self.searchBTN.isEnabled = true
            self.likeBTN.isEnabled = true
            self.dislikeBTN.isEnabled = true
            self.saveBTN.isEnabled = true
            self.resetBTN.isEnabled = true
        }
    }
    
    private func createCategoryObj() {
        var temporaryArray : [Picture] = []
        for i in AppConstants.cityPictures {
            temporaryArray.append(Picture(name: i, likeCount: String(arc4random_uniform(AppConstants.randomValueOfLikesAndDislikes)), dislikeCount: String(arc4random_uniform(AppConstants.randomValueOfLikesAndDislikes)), comments: []))
        }
        categoryObjects["cities"] = Category(with: AppConstants.cityKeywords, pictures: temporaryArray)
        
        temporaryArray = []
        for i in AppConstants.disneyMoviesPictures {
            temporaryArray.append(Picture(name: i, likeCount: String(arc4random_uniform(AppConstants.randomValueOfLikesAndDislikes)), dislikeCount: String(arc4random_uniform(AppConstants.randomValueOfLikesAndDislikes)), comments: []))
        }
        categoryObjects["movies"] = Category(with: AppConstants.disneyMoviesKeywords, pictures: temporaryArray)
        
        temporaryArray = []
        for i in AppConstants.shoesPictures {
            temporaryArray.append(Picture(name: i, likeCount: String(arc4random_uniform(AppConstants.randomValueOfLikesAndDislikes)), dislikeCount: String(arc4random_uniform(AppConstants.randomValueOfLikesAndDislikes)), comments: []))
        }
        categoryObjects["shoes"] = Category(with: AppConstants.shoesKeywords, pictures: temporaryArray)
        
        temporaryArray = []
        for i in AppConstants.wristWatchesPictures {
            temporaryArray.append(Picture(name: i, likeCount: String(arc4random_uniform(AppConstants.randomValueOfLikesAndDislikes)), dislikeCount: String(arc4random_uniform(AppConstants.randomValueOfLikesAndDislikes)), comments: []))
        }
        categoryObjects["watches"] = Category(with: AppConstants.wristWatchesKeywords, pictures: temporaryArray)
        
        temporaryArray = []
        for i in AppConstants.festivalsPictures {
            temporaryArray.append(Picture(name: i, likeCount: String(arc4random_uniform(AppConstants.randomValueOfLikesAndDislikes)), dislikeCount: String(arc4random_uniform(AppConstants.randomValueOfLikesAndDislikes)), comments: []))
        }
        categoryObjects["festivals"] = Category(with: AppConstants.festivalsKeywords, pictures: temporaryArray)
    }
    
    private func display(using index: Int) {
        self.likeBTN.setTitle(("👍"+category.pictures[index].likeCount), for: .normal)
        self.dislikeBTN.setTitle(("👎"+category.pictures[index].dislikeCount), for: .normal)
        
        if(category.pictures[index].comments.isEmpty == true) {
            self.pictureCommentsTV.text = "No comments yet."
        } else {
            var temp = 1
            self.pictureCommentsTV.text = "Comments:\n"
            for c in category.pictures[index].comments {
                self.pictureCommentsTV.text! += (String(temp) + ". " + c + "\n")
                temp += 1
            }
        }
    }
    
    @IBAction func moveToLeft(_ sender: UISwipeGestureRecognizer) {
        if(index < 4) {
            index += 1
            self.pictureIV.image = UIImage(named: category.pictures[index].name)
        } else {
            self.pictureIV.image = UIImage(named: category.pictures[4].name)
        }
        self.display(using: index)
        
    }
    
    @IBAction func moveToRight(_ sender: UISwipeGestureRecognizer) {
        if(index >= 0) {
            index -= 1
            self.pictureIV.image = UIImage(named: category.pictures[index].name)
        } else {
            self.pictureIV.image = UIImage(named: category.pictures[0].name)
        }
        self.display(using: index)
    }
    
    @IBAction func onDoubleTap(_ sender: UISwipeGestureRecognizer) {
        category.pictures[index].likeCount = String(Int(category.pictures[index].likeCount)!+1)
        self.likeBTN.setTitle(("👍"+category.pictures[index].likeCount), for: .normal)
    }
    
    @IBAction func onTripleTap(_ sender: UISwipeGestureRecognizer) {
        category.pictures[index].dislikeCount = String(Int(category.pictures[index].dislikeCount)!+1)
        self.dislikeBTN.setTitle(("👎"+category.pictures[index].dislikeCount), for: .normal)
    }
    
}

