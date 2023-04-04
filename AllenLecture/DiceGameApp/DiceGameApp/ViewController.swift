//
//  ViewController.swift
//  DiceGameApp
//
//  Created by 최수훈 on 2023/04/04.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    var diceArray : [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureStartImage()
    }
    
    func configureStartImage() {
        firstImageView.image = diceArray.randomElement()
        secondImageView.image = diceArray.randomElement()
    }

    
    @IBAction func rollButtonTapped(_ sender: UIButton) {
        
        // code..
        var firstImage: UIImage = diceArray.randomElement()!
        
        var secondImage: UIImage = diceArray.randomElement()!
        
        firstImageView.image = firstImage
        
        secondImageView.image = secondImage
//        firstImageView.image = randomImage
    }
    
    

}
