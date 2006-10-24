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

class Result:
	pass

class HighCard:
	@staticmethod
	def play():
		deck = Deck()

		playerCard = deck.draw()
		dealerCard = deck.draw()

		result = Result()
		result.playerCard = playerCard
		result.dealerCard = dealerCard

		if playerCard < dealerCard:
			result.message = "Sorry, you lose."
		elif playerCard > dealerCard:
			result.message = "You win!"
		else:
			result.message = "It's a tie."

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
			print "You drew the " + str(result.playerCard) + "."
			print "Dealer drew the " + str(result.dealerCard)+ "."
			print result.message
		elif line == "2":
			break
		else:
			print 'Unknown option.  Please select again.'
		
		print