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
 
function Deck() {
	this.cards = [];
	this.drawnCards = [];
	
	for(var i = 0; i < Card.ranks.length; i++)
		for(var j = 0; j < Card.suits.length; j++)
			this.cards.push(new Card(Card.ranks[i], Card.suits[j]));
}

Deck.prototype.draw = function() {
	var result;

	var index = Math.floor(Math.random() * this.cards.length);
	card = this.cards[index];
	
	if(this.drawnCards.indexOf(card) != -1)
		result = this.draw();
	else {
		this.drawnCards.push(card);
		result = card;
	}
	
	return result;
}

Deck.prototype.reset = function() {
	this.drawnCards = [];
}