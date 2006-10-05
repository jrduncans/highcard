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

Card.ranks = ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King'];
Card.suits = ['Clubs', 'Spades', 'Hearts', 'Diamonds'];

function Card(rank, suit) {
	this.rank = rank;
	this.suit = suit;
}

Card.prototype.toString = function() {
	return this.rank + " of " + this.suit;
}

Card.prototype.equal = function(other) {
	return this.rank == other.rank && this.suit == other.suit;
}

Card.prototype.compareTo = function(other) {
	var thisIndex = Card.ranks.indexOf(this.rank);
	var otherIndex = Card.ranks.indexOf(other.rank);

	if(thisIndex < otherIndex) {
		return -1;
	} else if(thisIndex > otherIndex) {
		return 1;
	} else {
		return 0;
	}
}