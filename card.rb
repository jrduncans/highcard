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

class Card
	attr_reader :rank, :suit
	attr_writer :rank, :suit
	
	@@ranks = ['Ace'] + (2..10).to_a + ['Jack', 'Queen', 'King']
	@@suits = %w(Clubs, Spades, Hearts, Diamonds)
	
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
  
	def == (other)
		@rank == other.rank and @suit == other.suit
	end
  
	def <=> (other)
		@@ranks.index(@rank) <=> @@ranks.index(other.rank)
	end
end