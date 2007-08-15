$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
require 'cards'

include Cards

describe Card, '(Ace of Clubs)' do
  before(:each) do
    @card = Card.new('Ace', 'Clubs')
  end

  it "should include 'ace' and 'clubs' in display" do
    @card.to_s.should match(/\bace\b.+\bclubs\b/i)
  end

  it 'should equal another Ace of Clubs' do
    @card.should eql(Card.new('Ace', 'Clubs'))
  end

  it 'should not equal an Ace of Spades' do
    @card.should_not eql(Card.new('Ace', 'Spades'))
  end

  it 'should not equal a Two of Clubs' do
    @card.should_not eql(Card.new(2, 'Clubs'))
  end

  it 'should be less than a Two of Clubs' do
    @card.should satisfy {|card| card < Card.new(2, 'Clubs')}
  end

  it 'should compare equally to an Ace of Spades' do
    (@card <=> Card.new('Ace', 'Spades')).should equal(0)
  end
end

describe Card, '(3 of Diamonds)' do
  before(:each) do
    @card = Card.new(3, 'Diamonds')
  end

  it 'should be greater than the Two of Clubs' do
    @card.should satisfy {|card| card > Card.new(2, 'Clubs')}
  end
end

require 'set'

describe Deck, '(new)' do
  before(:each) do
    @deck = Deck.new
  end

  it 'should have 52 unique cards' do
    set = Set.new

    52.times do
      set << @deck.draw
    end

    set.size.should equal(52)
  end
end

describe Deck, '(empty)' do
  before(:each) do
    @deck = Deck.new

    52.times { @deck.draw }
  end

  it 'should have 52 cards after resetting' do
    @deck.reset

    cards = []
    52.times { cards << @deck.draw }

    cards.length.should equal(52)
  end
end
