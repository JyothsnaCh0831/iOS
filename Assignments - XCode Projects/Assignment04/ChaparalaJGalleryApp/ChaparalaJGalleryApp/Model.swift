//
//  Model.swift
//  ChaparalaJGalleryApp
//
//  Created by Chaparala,Jyothsna on 3/6/23.
//

import Foundation


struct AppConstants {
    static let cityKeywords = ["NewYork", "Belgium", "Paris", "Syndey", "Rome", "City", "Cities", "city", "cities"]
    static let cityPictures = ["newyork", "belgium", "paris", "syndey", "rome"]
    
    static let disneyMoviesKeywords = ["Raya", "Tangled", "Onward", "Tunring Red", "Enchanto", "Disney", "disney", "Movie", "movie", "Movies", "movies"]
    static let disneyMoviesPictures = ["raya", "tangled", "onward", "turningRed", "enchanto"]
    
    static let shoesKeywords = ["Chelsea", "Sneakers", "Chukka", "Brogues", "SlipsOns", "Shoe", "Shoes", "shoe", "shoes"]
    static let shoesPictures = ["chelsea", "sneakers", "chukka", "brogues", "slipsOns"]
    
    static let wristWatchesKeywords = ["Rolex", "Titan", "Fastrack", "One Plus", "Fossil", "Watch", "Watches", "watch", "watches"]
    static let wristWatchesPictures = ["rolex", "titan", "fastrack", "oneplus", "fossil"]
    
    static let festivalsKeywords = ["Chinese New Year", "Seoul Lantern", "Diwali", "Christmas", "Halloween", "Festivals", "festivals", "Festival", "festival"]
    static let festivalsPictures = ["chineseNewYear", "seoulLantern", "halloween", "diwali", "christmas"]
    
    static let randomValueOfLikesAndDislikes : UInt32 = 100
    static let defaultSearchMessage = "Sorry! No pictures found for the search. Try again with a different search keyword."
    static let defaultCommentMessage = "No comments yet."
}

struct Picture {
    let name : String
    var likeCount : String
    var dislikeCount : String
    var comments: [String]
}

class Category {
    var keywords: [String]
    var pictures: [Picture]
    
    init(with keywords: [String], pictures: [Picture]) {
        self.keywords = keywords
        self.pictures = pictures
    }
}
