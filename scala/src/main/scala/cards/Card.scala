package cards

sealed trait Suit
case object Clubs extends Suit
case object Spades extends Suit
case object Hearts extends Suit
case object Diamonds extends Suit

case class Card(rank: String, suit: Suit) extends Ordered[Card] {
  override def compare(that: Card): Int = Card.ranks.indexOf(this.rank) - Card.ranks.indexOf(that.rank)
  override def toString: String = s"$rank of $suit"
}

object Card {
  lazy val suits: Seq[Suit] = Seq(Clubs, Spades, Hearts, Diamonds)
  lazy val ranks: Seq[String] = "Ace" :: (1 to 10).map(_.toString).toList ::: "Jack" :: "Queen" :: "King" :: Nil
}
