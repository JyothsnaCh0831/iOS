//
//  ActorRatingVC.swift
//  ChaparalaJEntertainmentApp
//
//  Created by Chaparala,Jyothsna on 4/14/23.
//

import UIKit

class ActorRatingVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var actorIMG: UIImageView!
    
    @IBOutlet weak var actingTF: UITextField!
    
    @IBOutlet weak var danceTF: UITextField!
    
    @IBOutlet weak var actionEpisodesTF: UITextField!
    
    @IBOutlet weak var overallPerformanceSlider: UISlider!
    
    var actor: Int = 0
    
    var emojis = ["🔥", "😵‍💫", "💩", "💀", "👌🏻"]
    
    var actingPickerView = UIPickerView()
    var dancePickerView = UIPickerView()
    var fightPickerView = UIPickerView()
    
    @IBAction func save(_ sender: UIButton) {
        actorsList[self.actor].actionEpisodes = self.actionEpisodesTF.text!
        actorsList[self.actor].dancingSkills = self.danceTF.text!
        actorsList[self.actor].performanceSkills = self.actingTF.text!
        actorsList[self.actor].overallRating = String(self.overallPerformanceSlider.value)
        
        let dialogMessage = UIAlertController(title: "Success✅", message: "Ratings are saved", preferredStyle: .alert)
        let done = UIAlertAction(title: "Done", style: .default)
        dialogMessage.addAction(done)
        self.present(dialogMessage, animated: true)
    }
    
    @IBAction func clearRatings(_ sender: UIBarButtonItem) {
        actorsList[self.actor].actionEpisodes = ""
        actorsList[self.actor].dancingSkills = ""
        actorsList[self.actor].performanceSkills = ""
        actorsList[self.actor].overallRating = ""
        self.actionEpisodesTF.text = ""
        self.danceTF.text = ""
        self.actingTF.text = ""
        self.overallPerformanceSlider.setValue(self.overallPerformanceSlider.minimumValue, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.actorIMG.image = UIImage(named: actorsList[self.actor].actorImageName)
        self.setAttributes(for: self.actorIMG)
    
        self.actingPickerView.delegate = self
        self.actingPickerView.dataSource = self
        self.actingTF.inputView = self.actingPickerView
        
        self.dancePickerView.delegate = self
        self.dancePickerView.dataSource = self
        self.danceTF.inputView = self.dancePickerView
        
        self.fightPickerView.delegate = self
        self.fightPickerView.dataSource = self
        self.actionEpisodesTF.inputView = self.fightPickerView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.actingTF.text = actorsList[self.actor].performanceSkills
        self.danceTF.text = actorsList[self.actor].dancingSkills
        self.actionEpisodesTF.text = actorsList[self.actor].actionEpisodes
        
        if(actorsList[self.actor].overallRating != "") {
            if let rating = Float(actorsList[self.actor].overallRating) {
                self.overallPerformanceSlider.setValue(rating, animated: true)
            }
        } else {
            self.overallPerformanceSlider.setValue(0, animated: true)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.emojis.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.emojis[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView == self.actingPickerView) {
            self.actingTF.text = self.emojis[row]
            self.actingTF.resignFirstResponder()
        } else if(pickerView == self.dancePickerView) {
            self.danceTF.text = self.emojis[row]
            self.danceTF.resignFirstResponder()
        } else {
            self.actionEpisodesTF.text = self.emojis[row]
            self.actionEpisodesTF.resignFirstResponder()
        }
    }
    
    
    private func setAttributes(for view: UIView) {
        view.layer.cornerRadius = 20.0
        view.layer.masksToBounds = true
        view.layer.borderWidth = 2.0
        view.layer.borderColor = UIColor.black.cgColor
    }

}
