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


package cards;

import java.util.List;
import java.util.ArrayList;

public class Deck {
	private List<Card> cards;
	private List<Card> drawnCards;
	
	public Deck() {
		this.cards = new ArrayList<Card>();
		this.drawnCards = new ArrayList<Card>();
		
		for(String rank : Card.ranks) {
			for(String suit : Card.suits) {
				this.cards.add(new Card(rank, suit));
			}
		}
	}
	
	public Card draw() {
		Card result;
	
		int index = (int)Math.floor(Math.random() * this.cards.size());
		Card card = this.cards.get(index);
		
		if(this.drawnCards.indexOf(card) == -1) {
			this.drawnCards.add(card);
			result = card;
		}
		else
			result = this.draw();
		
		return result;
	}
	
	public void reset() {
		this.drawnCards = new ArrayList<Card>();
	}
}
