package highcard

import cards.{Deck, Card}

object HighCard extends App {

  case class Result(playerCard: Card, dealerCard: Card, message: String)

  def play = {
    val deck = new Deck()

    val playerCard = deck.draw
    val dealerCard = deck.draw

    val message = if (playerCard < dealerCard) "Sorry, you lose."
    else if (playerCard > dealerCard) "You win!"
    else "It's a tie."

    Result(playerCard, dealerCard, message)
  }

  def printInstructions() = {
    println("1: Play")
    println("2: Quit")
    println("Enter the number of the option:")
  }

  var keepPlaying = true
  val reader = io.Source.stdin.bufferedReader()

  while(keepPlaying) {
    printInstructions()

    val line = reader.readLine()

    line match {
      case "1" =>
        val result = play

        println("")
        println(s"You drew the ${result.playerCard}.")
        println(s"Dealer drew the ${result.dealerCard}.")
        println(result.message)
      case "2" => keepPlaying = false
      case _ => println("Unknown option.  Please select again.")
    }

    println()
  }
}
