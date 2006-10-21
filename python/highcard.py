#!/bin/env python

# Copyright 2006 Stephen Duncan Jr
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License. 
# You may obtain a copy of the License at 
# 	http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from cards import Card, Deck

class HighCard:
	@staticmethod
	def play():
		deck = Deck()

		card1 = deck.draw()
		card2 = deck.draw()

		result = {"yourCard":card1, "dealerCard":card2}

		comparison = cmp(card1, card2)

		if comparison < 0:
			result["result"] = "Sorry, you lose."
		elif comparison == 0:
			result["resut"] = "It's a tie."
		else:
			result["result"] = "You win!"

		return result

def printInstructions():
	print '1: Play'
	print '2: Quit'
	print 'Enter the number of the option:'

if __name__ == "__main__":	
	while True:
		printInstructions()
		
		line = raw_input()
		
		if line == "1":
			result = HighCard.play()
				
			print ""
			print "You drew the " + str(result["yourCard"]) + "."
			print "Dealer drew the " + str(result["dealerCard"])+ "."
			print result["result"]
		elif line == "2":
			break
		else:
			print 'Unknown option.  Please select again.'
		
		print