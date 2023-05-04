//
//  Model.swift
//  ChaparalaJEntertainmentApp
//
//  Created by Chaparala,Jyothsna on 4/20/23.
//

import Foundation


struct Actor {
    var fullName: String
    var yearsActive: String
    var movies: [String]
    var actorImageName: String
    var actionEpisodes: String
    var dancingSkills: String
    var performanceSkills: String
    var overallRating: String
}


struct Music {
    var title: String
    var composer: String
    var videoId: String
}

var actorsList: [Actor] = [
    Actor(fullName: "Uppalapati Venkata Suryanarayana Prabhas Raju", yearsActive: "2004 to present", movies: ["billa", "darling", "saaho", "chakram", "buggigaadu", "mrPerfect"], actorImageName: "prabhas", actionEpisodes: "", dancingSkills: "", performanceSkills: "", overallRating: ""),
    Actor(fullName: "Nandamuri Taraka Rama Rao Jr.", yearsActive: "2001 to present", movies: ["dammu", "ashok", "temper", "baadshah", "simhadri", "rrr"], actorImageName: "jrNtr", actionEpisodes: "", dancingSkills: "", performanceSkills: "", overallRating: ""),
    Actor(fullName: "Ghattamaneni Mahesh Babu", yearsActive: "2001 to present", movies: ["murari", "pokiri", "maharshi", "svsc", "spyder", "okkadu"], actorImageName: "mahesh", actionEpisodes: "", dancingSkills: "", performanceSkills: "", overallRating: ""),
    Actor(fullName: "Saravanan SivaKumar", yearsActive: "1997 to present", movies: ["s3", "aaru", "24", "jaiBhim", "7thsense", "brothers"], actorImageName: "surya", actionEpisodes: "", dancingSkills: "", performanceSkills: "", overallRating: ""),
    Actor(fullName: "Vishwak Sen", yearsActive: "2017 to present", movies: ["eni", "paagal", "oriDevuda", "hit", "aak", "dhamki"], actorImageName: "sen", actionEpisodes: "", dancingSkills: "", performanceSkills: "", overallRating: "")
]


let songs: [Music] = [
    Music(title: "Vaathi Coming", composer: "Anirudh RaviChandar & Gana balachandar", videoId: "fRD_3vJagxk"),
    Music(title: "Private Party", composer: "Anirudh RaviChandar & Jonita Gandhi", videoId: "SPmec1w1sXU"),
    Music(title: "Inthandam", composer: "Vishal Chandrasekhar & S.P.Charan", videoId: "dOKQeqGNJwY"),
    Music(title: "Naatu Naatu", composer: "Rahul Sipligunj & Kaala Bhairava", videoId: "pBVtSwb5G7M"),
    Music(title: "Gundellonna", composer: "Leon James & Anirudh RaviChandar", videoId: "t_aO4EMP-i0")
]
