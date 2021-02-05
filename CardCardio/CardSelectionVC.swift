//
//  CardSelectionVC.swift
//  CardCardio
//
//  Created by Vasili Mandalac on 2/4/21.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    @IBOutlet var cardImageView: UIImageView!
    //We don't need them anymore
    //@IBOutlet var stopButton:    UIButton!
    //@IBOutlet var restartButton: UIButton!
    //@IBOutlet var rulesButton:   UIButton!
    @IBOutlet var buttons: [UIButton]!
    
    //Here we import the cards array from the Card.swift struct
    var cards: [UIImage] = Card.allValues
    
    //Here we add the timer var
    var timer: Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //This will make the backgroung white for light mode and dark for dark mode
        //view.backgroundColor = .systemBackground
        
        //Here we call the bottom func to run
        startTimer()
        
        //Adding border radius to buttons long way
        //stopButton.layer.cornerRadius    = 8
        //restartButton.layer.cornerRadius = 8
        //rulesButton.layer.cornerRadius   = 8
        
        //OR DRY(Short way)
        for button in buttons {
            button.layer.cornerRadius = 8
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    
    //Timer function
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    
    //func to show random image,is @objc because of top selector which image to display in that interval
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        //Here we change the button title when is tapped
        //stopButton.setTitle("Touched!", for: .normal)
        
        //But this makes the timer to stop when the button in tapped
        timer.invalidate()
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    //
    //    @IBAction func rulesButtonTapped(_ sender: UIButton) {
    //
    //    }
}
