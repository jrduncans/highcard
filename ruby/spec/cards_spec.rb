require 'cards'

context 'An Ace of Clubs' do
  setup do
    @card = Cards::Card.new('Ace', 'Clubs')
  end

  specify "should include 'ace' and 'clubs' in display" do
    @card.to_s.should_match /\bace\b.+\bclubs\b/i
  end

  specify 'should equal another Ace of Clubs' do
    @card.should_eql Cards::Card.new('Ace', 'Clubs')
  end

  specify 'should not equal an Ace of Spades' do
    @card.should_not_eql Cards::Card.new('Ace', 'Spades')
  end

  specify 'should not equal a Two of Clubs' do
    @card.should_not_eql Cards::Card.new(2, 'Clubs')
  end

  specify 'should be less than a Two of Clubs' do
    @card.should_be < Cards::Card.new(2, 'Clubs')
  end

  specify 'should compare equally to an Ace of Spades' do
    (@card <=> Cards::Card.new('Ace', 'Spades')).should_equal 0
  end
end

context 'A 3 of Diamonds' do
  setup do
    @card = Cards::Card.new(3, 'Diamonds')
  end

  specify 'should be greater than the Two of Clubs' do
    @card.should_be > Cards::Card.new(2, 'Clubs')
  end
end

require 'set'

context 'A new Deck' do
  setup do
    @deck = Cards::Deck.new
  end

  specify 'should have 52 unique cards' do
    set = Set.new

    52.times do
      set << @deck.draw
    end

    set.size.should_equal 52
  end
end

context 'An empty Deck' do
  setup do
    @deck = Cards::Deck.new

    52.times { @deck.draw }
  end

  specify 'should have 52 cards after resetting' do
    @deck.reset

    cards = []
    52.times { cards << @deck.draw }

    cards.length.should_equal 52
  end
end
