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


package highcard;

import cards.Deck;
import cards.Card;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class HighCard {
	static class Result {
		public Card playerCard;
		public Card dealerCard;
		public String message;
	}
	
	public static Result play() {
		Deck deck = new Deck();
		
		Card playerCard = deck.draw();
		Card dealerCard = deck.draw();
		
		Result result = new Result();
		result.playerCard = playerCard;
		result.dealerCard = dealerCard;
		
		int comparison = playerCard.compareTo(dealerCard);
	
		if(comparison < 0)
			result.message = "Sorry, you lose.";
		else if(comparison > 0)
			result.message = "You win!";
		else
			result.message = "It's a tie.";
			
		return result;
	}
	
	public static void printInstructions() {
		System.out.println("1: Play");
		System.out.println("2: Quit");
		System.out.println("Enter the number of the option:");
	}
	
	public static void main(String[] args) {
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
		
		while(true) {
			printInstructions();
			
			String line = "";
			
			try {
				line = reader.readLine();
			} catch (IOException e) {
				throw new RuntimeException("Error reading from standard in.", e);
			}
			
			if ("1".equals(line)) {
				Result result = HighCard.play();
				
				System.out.println("");
				System.out.println("You drew the " + result.playerCard + ".");
				System.out.println("Dealer drew the " + result.dealerCard + ".");
				System.out.println(result.message);
			}
			else if ("2".equals(line)) {
				break;
			}
			else
				System.out.println("Unknown option.  Please select again.");
			
			System.out.println();
		}
	}
}