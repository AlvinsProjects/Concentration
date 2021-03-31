//
//  ViewController.swift
//  Concentration
//
//  Created by Alvin Alleyne on 3/31/21.
//

import UIKit

class ViewController: UIViewController {
	
	var flipCount:  Int  = 0 {
		didSet {
			flipCountLabel.text = "Flips: \(flipCount)"
		}
	}
	
	@IBOutlet weak var flipCountLabel: UILabel!
	@IBOutlet var cardButton: [UIButton]!
	
	var emojiChoices = ["🎃","👻","🎃","👻"]
	
	@IBAction func touchCard(_ sender: UIButton) {
		flipCount += 1
		if let cardNumber = cardButton.firstIndex(of: sender) {
			flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
		} else {
			print("Chosen card was not in cardButtons")
		}
	}
	
	func flipCard(withEmoji emoji: String, on button: UIButton) {
		if button.currentTitle == emoji {
			button.setTitle("", for: UIControl.State.normal)
			button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
		} else {
			button.setTitle(emoji, for: UIControl.State.normal)
			button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		}
	}
	
	
	
//	override func viewDidLoad() {
//		super.viewDidLoad()
//		// Do any additional setup after loading the view.
//	}


}

