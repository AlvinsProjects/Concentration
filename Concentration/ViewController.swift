//
//  ViewController.swift
//  Concentration
//
//  Created by Alvin Alleyne on 3/31/21.
//

import UIKit

class ViewController: UIViewController {
	
	private lazy var game: Concentration = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
	
	private let emojiLibrary = ["😀☺️😘🤪😞😇😎😆😅😭😳😠",
								"🎃👻😈👽👹🤡🍭🔮💉⛓💊🕯",
								"🚗🚕🚙🚌🚎🏎🚓🚑🚒🚐🚚🚜",
								"🐶🐱🐭🐹🐰🦊🐻🐼🐨🐯🦁🐮",
								"⚽️🏀🏈⚾️🎾🏐🏉🎱🏓🏒⛳️🥊",
								"👏🤝👍👎👊✊🤞🤟👌🖐🤙☝️"]
	
	private lazy var theme = emojiLibrary[emojiLibrary.count.arc4random]
	
	var numberOfPairsOfCards: Int {
		return (cardButtons.count + 1) / 2
	}
	
	private(set) var flipCount:  Int = 0 {
		didSet {
			updateFlipCountLabel()
		}
	}
	
	private func updateFlipCountLabel() {
		let attributes: [NSAttributedString.Key: Any] = [
			.strokeWidth : 5.0,
			.strokeColor : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
		]
		let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
		flipCountLabel.attributedText = attributedString
	}
	
	@IBOutlet private weak var flipCountLabel: UILabel! {
		didSet {
			updateFlipCountLabel()
		}
	}
	
	@IBOutlet private var cardButtons: [UIButton]!
		
	@IBAction private func touchCard(_ sender: UIButton) {
		flipCount += 1
		if let cardNumber = cardButtons.firstIndex(of: sender) {
			game.chooseCard(at: cardNumber)
			updateViewFromModel(touchedCard: 0)
		} else {
			print("Chosen card was not in cardButtons")
		}
	}
	
	
	@IBAction private func newGame(_ sender: UIButton) {
		flipCount = 0
		// Create new game struct, initialize everything Model
		game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
		
		// Initialize everything view
//		gameOverLabel.isHidden = true
		emoji.removeAll()
		theme = emojiLibrary[emojiLibrary.count.arc4random]
		updateViewFromModel(touchedCard: 0)
			
		}
	
	private func updateViewFromModel(touchedCard: Int) {
		for index in cardButtons.indices {
			let button = cardButtons[index]
			let card = game.cards[index]
			if card.isFaceUp {
				button.setTitle(getEmoji(for: card), for: UIControl.State.normal)
				button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
			} else {
				button.setTitle("", for: UIControl.State.normal)
				button.backgroundColor = card.isMatched ?  #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
			}
		}
	}
	
	private var emoji = [Card:String]()  // Dictionary
	
	private func getEmoji(for card: Card) -> String {
		if emoji[card] == nil, theme.count > 0 {
			let randomStringIndex = theme.index(theme.startIndex, offsetBy: theme.count.arc4random)
			emoji[card] = String(theme.remove(at: randomStringIndex))
		}
		return emoji[card] ?? "?"
		}
	}
	

extension Int {
	var arc4random: Int{
		if self > 0 {
			return Int(arc4random_uniform(UInt32(self)))
		} else if self < 0 {
			return -Int(arc4random_uniform(UInt32(abs(self))))
		} else {
			return 0
		}
	}
}





