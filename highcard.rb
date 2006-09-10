#!/bin/env ruby

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

require "deck"
require "card"

def printInstructions
	puts '1: Play'
	puts '2: Quit'
	puts 'Enter the number of the option:'
end

$stdout.sync = true

deck = Deck.new

loop do
	deck.reset
	printInstructions
	
	line = gets
	
	case line
		when /1/
			card1 = deck.draw
			card2 = deck.draw
			
			puts "You drew the #{card1}."
			puts "Dealer drew the #{card2}."
			
			comparison = card1 <=> card2
		
			if(comparison < 0)
				puts "Sorry, you lose."
			elsif(comparison == 0)
				puts "It's a tie."
			else
				puts "You win!"
			end
		when /2/
			break
		else
			puts 'Unknown option.  Please select again.'
	end
	
	puts
end