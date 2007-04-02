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

class Card implements Comparable {
	static ranks = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]
	static suits = ["Clubs", "Spades", "Hearts", "Diamonds"]

	def rank
	def suit
	
	Card(rank, suit) {
		this.rank = rank
		this.suit = suit
	}
	
	String toString() {
		"${rank} of ${suit}"
	}
	
	boolean sameAs(other) {
		this.rank == other.rank && this.suit == other.suit
	}
	
	int hashCode() {
		rank.hashCode() + suit.hashCode()
	}
	
	int compareTo(other) {
		def thisIndex = ranks.indexOf(rank)
		def otherIndex = ranks.indexOf(other.rank)
		
		if(thisIndex < otherIndex)
			return -1
		else if(thisIndex > otherIndex)
			return 1
		else
			return 0
	}
}