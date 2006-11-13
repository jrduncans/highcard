#!/bin/env ruby

# Copyright 2006 Stephen Duncan Jr
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#       http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'test/unit'
require 'cards'
require 'set'

class CardTest < Test::Unit::TestCase
	def setup
		@ace_of_clubs = Cards::Card.new('Ace', 'Clubs')
		@ace_of_spades = Cards::Card.new('Ace', 'Spades')
		@two_of_clubs = Cards::Card.new(2, 'Clubs')
		@three_of_diamonds = Cards::Card.new(3, 'Diamonds')
	end

	def test_equality
		ace_of_clubs = Cards::Card.new('Ace', 'Clubs')

		assert_equal(@ace_of_clubs, ace_of_clubs)
		assert_not_equal(@ace_of_clubs, @ace_of_spades)
		assert_not_equal(@ace_of_clubs, @two_of_clubs)
	end

	def test_comparison
		assert(@ace_of_clubs < @two_of_clubs, 'Ace not greater than or equal to two' )
		assert(@three_of_diamonds > @two_of_clubs, 'Two not less than or equal to three')

		assert_equal(@ace_of_clubs <=> @ace_of_spades, 0, 'Ace of Clubs not greater than or less than Ace of Spades')
	end

	def test_tostring
		assert_match(/\bace\b.+\bclubs\b/i, @ace_of_clubs.to_s)
	end
end

class DeckTest < Test::Unit::TestCase
	def setup
		@deck = Cards::Deck.new
		@set = Set.new
	end

	def test_draw
		52.times do
			@set << @deck.draw
		end

		assert(@set.size == 52, '52 different cards not drawn.')
	end

	def test_reset
		52.times do
			@set << @deck.draw
		end

		@deck.reset

		@set << @deck.draw

		assert(@set.size == 52, 'Deck not reset correctly.')
	end
end
