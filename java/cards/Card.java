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

import java.util.Arrays;
import java.util.List;

public class Card implements Comparable {
	public static List<String> ranks = Arrays.asList(new String[] {"Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"});
	public static List<String> suits = Arrays.asList(new String[] {"Clubs", "Spades", "Hearts", "Diamonds"});
	
	private String rank;
	private String suit;
	
	public Card(String rank, String suit) {
		this.rank = rank;
		this.suit = suit;
	}
	
	public String toString() {
		return this.rank + " of " + this.suit;
	}
	
	public boolean equals(Object otherObj) {
		Card other = (Card)otherObj;
		return this.rank.equals(other.getRank()) && this.suit.equals(other.getSuit());
	}
	
	public int hashCode() {
		return this.rank.hashCode() + this.suit.hashCode();
	}
	
	public int compareTo(Object otherObj) {
		Card other = (Card)otherObj;
		
		int thisIndex = Card.ranks.indexOf(this.rank);
		int otherIndex = Card.ranks.indexOf(other.getRank());
	
		if(thisIndex < otherIndex)
			return -1;
		else if(thisIndex > otherIndex)
			return 1;
		else
			return 0;
	}
	
	public String getRank() {
		return this.rank;
	}
	
	public String getSuit() {
		return this.suit;
	}
}
