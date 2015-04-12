assert = chai.assert

deck = null
hand = null

beforeEach ->
deck = new Deck()
hand = deck.dealPlayer()

describe "Blackjack Rules", ->

  it "display bust on greater than 21", ->
    while hand.minScore < 22
      hand.hit()
    #assert.strict
    # TODO: write tests ...


