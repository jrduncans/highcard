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

function HighCard() {};

HighCard.play = function play() {
	var result = {};

	var deck = new Deck();
		
	card1 = deck.draw();
	card2 = deck.draw();
	
	result["yourCard"] = card1;
	result["dealerCard"] = card2;
	
	var comparison = card1.compareTo(card2);

	if(comparison < 0)
		result["result"] = "Sorry, you lose.";
	else if(comparison == 0)
		result["result"] = "It's a tie.";
	else
		result["result"] = "You win!";
		
	return result;
}