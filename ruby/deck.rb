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

require "card"

class Deck	
	def initialize
		@cards = []
		@drawnCards = []
		Card.ranks.each { |rank| Card.suits.each { |suit| @cards.push(Card.new(rank, suit)) } }
	end
	
	def draw
		@index = rand(@cards.size)
		card = @cards[@index]
		
		if @drawnCards.include? card
			result = draw
		else
			@drawnCards.push(card)
			result = card
		end
		
		@index += 1 unless @index >= (Card.ranks.size - 1)
		
		return result
	end
	
	def reset
		@drawnCards = []
		@index = 0
	end
end