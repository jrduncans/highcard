package cards

import scala.util.Random

class Deck {
  lazy val cards: Seq[Card] = for {
    rank <- Card.ranks
    suit <- Card.suits
  } yield Card(rank, suit)

  var drawnCards: Seq[Card] = Seq()

  def draw: Card = {
    val card = cards(Random.nextInt(cards.size))

    if(drawnCards.contains(card)) draw
    else {
      drawnCards = drawnCards :+ card
      card
    }
  }

  def reset(): Unit = {
    drawnCards = Seq()
  }
}
