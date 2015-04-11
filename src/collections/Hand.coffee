class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
    @on 'add', @isBust, @

    @isBusted = false

  hit: ->
    if @isDealer
      @add(@deck.pop()) until @doesDealerStop()

    else
      card = @deck.pop()
      @add(card)
      card

  stand: ->
    @trigger 'ended'

  doesDealerStop: ->
    if (@hasAce())
      console.log("has ace")
      ( @scores()[1] > 17 and @scores()[1] < 22 ) or @scores()[0] > 16
    else
      @scores()[0] > 16

  isBust: ->
    if @scores()[0] > 21
      @isBusted = true
    else
      @isBusted = false


  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]


