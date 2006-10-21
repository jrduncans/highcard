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

module Cards
	class Card
		include Comparable
		
		attr_reader :rank, :suit
		attr_writer :rank, :suit
		
		@@ranks = ['Ace'] + (2..10).to_a + ['Jack', 'Queen', 'King']
		@@suits = %w(Clubs Spades Hearts Diamonds)
		
		def Card.ranks
			@@ranks
		end
		
		def Card.suits
			@@suits
		end
	
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

	class Deck	
		def initialize
			@cards = []
			@drawnCards = []
			Card.ranks.each { |rank| Card.suits.each { |suit| @cards.push(Card.new(rank, suit)) } }
		end
		
		def draw
			index = rand(@cards.size)
			card = @cards[index]
			
			if @drawnCards.include? card
				result = draw
			else
				@drawnCards.push(card)
				result = card
			end
			
			return result
		end
		
		def reset
			@drawnCards = []
		end
	end
end