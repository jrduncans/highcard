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
 
package highcard

import cards.Deck
import cards.Card

class Result {
	def playerCard
	def dealerCard
	def message
}

class HighCard {
	static Result play() {
		def deck = new Deck()
		
		def playerCard = deck.draw()
		def dealerCard = deck.draw()
		
		def result = new Result()
		result.playerCard = playerCard
		result.dealerCard = dealerCard
		
		if(playerCard < dealerCard)
			result.message = "Sorry, you lose."
		else if(playerCard > dealerCard)
			result.message = "You win!"
		else
			result.message = "It's a tie."
			
		return result
	}
	
	static void printInstructions() {
		println("1: Play");
		println("2: Quit");
		println("Enter the number of the option:");
	}
	
	static void main(args) {		
		while(true) {
			printInstructions();
			
			def line = "";
			
			line = System.in.readLine();
			
			switch(line) {
				case "1" :
					Result result = HighCard.play();
					
					println("");
					println("You drew the ${result.playerCard}.");
					println("Dealer drew the ${result.dealerCard}.");
					println(result.message);
				break;
				
				case "2" :
					return;
				
				default :
					println("Unknown option.  Please select again.");
			}
			
			println();
		}
	}
}
