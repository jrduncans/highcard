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

class Card:	
	ranks = ['Ace'] + range(2,11) + ['Jack', 'Queen', 'King']
	suits = ['Clubs', 'Spades', 'Hearts', 'Diamonds']

	def __init__(self, rank, suit):
		self.rank = rank
		self.suit = suit
  
	def __str__(self):
		return "%s of %s" % (self.rank, self.suit)
  
	def __eq__(self, other):
		return self.rank == other.rank and self.suit == other.suit
		
	def __ne__(self, other):
		return not self.__eq__(other)
  
	def __cmp__(self, other):
		return cmp(Card.ranks.index(self.rank), Card.ranks.index(other.rank))
	
from random import choice

class Deck:
	def __init__(self):
		self.cards = [Card(rank, suit) for rank in Card.ranks for suit in Card.suits]
		self.drawnCards = []
	
	def draw(self):
		card = choice(self.cards)
		
		if card in self.drawnCards:
			result = draw
		else:
			self.drawnCards.append(card)
			result = card
		
		return result
	
	def reset(self):
		self.drawnCards = []