/*
 * Copyright 2006 Stephen Duncan Jr
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License. 
 * You may obtain a copy of the License at 
 * 	http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package cards

class Deck {
	def cards
	def private drawnCards
	
	Deck() {
		cards = []
		drawnCards = []
		
		Card.ranks.each { rank -> 
			Card.suits.each { suit ->
				cards.add(new Card(rank, suit))
			}
		}
	}
	
	Card draw() {
		def result
		
		def index = Math.floor(Math.random() * this.cards.size()).toInteger()
		def card = cards.get(index)
		
		if(!drawnCards.any {drawnCard -> drawnCard.sameAs(card)}) {
			drawnCards.add(card)
			result = card
		} else
			result = draw()
		
		return result
	}
	
	void reset() {
		drawnCards = []
	}
}
