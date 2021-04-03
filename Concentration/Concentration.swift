//
//  Concentration.swift
//  Concentration
//
//  Created by Alvin Alleyne on 4/2/21.
//

import Foundation

class Concentration {
	
	var cards = [Card]()
	var indexOfOneAndOnlyFaceUpCard: Int?

	func chooseCard(at index: Int) {
		if !cards[index].isMatched {
			if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
				//check if cards match
				if cards[matchIndex].identifier == cards[index].identifier {
					cards[matchIndex].isMatched = true
					cards[index].isMatched = true
				}
				cards[index].isFaceUp = true
				indexOfOneAndOnlyFaceUpCard = nil
			} else {
				// either no cards or 2 cards are face up
				for flipDownIndex in cards.indices {
					cards[flipDownIndex].isFaceUp = false
				}
				cards[index].isFaceUp = true
				indexOfOneAndOnlyFaceUpCard = index
			}
		}
	}
	
	
	
	init(numberOfPairsOfCards: Int) {
		for _ in 1...numberOfPairsOfCards {
			let card = Card()
			cards += [card, card]
		}
		
		//TODO: Shuffle the cards
	}
}


//if cards[index].isFaceUp {
//	cards[index].isFaceUp = false
//} else {
//	cards[index].isFaceUp = true
//}
