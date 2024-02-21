box::use(
  R6[R6Class]
)

# ------------
#
# Create an R6 class that represents a shuffled deck of cards. You should be
# able to draw cards from the deck with $draw(n), and return all cards to the
# deck and reshuffle with $reshuffle().
# Use the following code to make a vector of cards.
# suit <- c("♠", "♥", "♦", "♣")
# value <- c("A", 2:10, "J", "Q", "K")
# cards <- paste0(rep(value, 4), suit)
#
# ------------

ShuffledCardDeck <- R6Class(
  classname = "Deck",
  public = list(
    cards = NULL,
    initialize = \() {
      self$reshuffle()
    },
    draw = \(n = 1) {
      card <- sample(x = self$cards, size = n)
      self$cards <- setdiff(self$cards, card)
      card
    },
    reshuffle = \() {
      suit <- c("♠", "♥", "♦", "♣")
      value <- c("A", 2:10, "J", "Q", "K")
      cards <- paste0(rep(value, 4), suit)
      shuffled <- sample(x = cards, size = length(cards))
      self$cards <- shuffled
      invisible(self)
    }
  )
)

deck <- ShuffledCardDeck$new()
deck$cards
deck$draw()
deck$cards
deck$draw(3)
deck$cards
deck$reshuffle()
deck$cards
