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

# This module provides basic playing cards.  It provides a Card and Deck class.
# Can be used to implement a card game.
#
# Author::	Stephen Duncan Jr (mailto:jrduncans@stephenducanjr.com)
# Copyright::	Copyright 2006 Stephen Duncan Jr
# License::	Apache License, Version 2.0
module Cards
	# This class represents a playing card, and also provides class methods 
	# to get the lists of ranks and suits.  Cards can be compared using their 
	# rank, but equality is based on rand and suit both being equal.
	class Card
		include Comparable
		
		attr_reader :rank, :suit
		
		@@ranks = ['Ace'] + (2..10).to_a + ['Jack', 'Queen', 'King']
		@@suits = %w(Clubs Spades Hearts Diamonds)
		
		# The available ranks for playing cards, in order from lowest
		# to highest ('Ace' through 'King').  Numerical ranks are 
		# integers, while non-numerical ranks are strings.
		def Card.ranks
			@@ranks
		end

		# The available suits for playing cards, in no particular order.
		def Card.suits
			@@suits
		end
	
		# Creates a card with the given rank and suit.
		def initialize(rank, suit)
			@rank = rank
			@suit = suit
		end
	
		def to_s
			"#{@rank} of #{@suit}"
		end
	
		def hash
			@rank.hash + @suit.hash
		end
	
		def eql? (other)
			self == other
		end
	
		def == (other)
			@rank == other.rank and @suit == other.suit
		end
	
		def <=> (other)
			@@ranks.index(@rank) <=> @@ranks.index(other.rank)
		end
	end

	# This class represents a standard 52-card deck of cards.  It keeps track 
	# of the cards that have been drawn.
	class Deck
		# Creates a new deck with no cards drawn.
		def initialize
			@cards = []
			@drawnCards = []
			Card.ranks.each {|rank| Card.suits.each {|suit| @cards << Card.new(rank, suit) } }
		end
		
		# Draws a random card.
		def draw
			index = rand(@cards.size)
			card = @cards[index]
			
			if @drawnCards.include? card
				draw
			else
				@drawnCards.push(card)
				return card
			end
		end
		
		# Puts all drawn cards back into the deck.
		def reset
			@drawnCards = []
		end
	end
end
