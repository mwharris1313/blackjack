class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    # @collection.on 'change:revealed', ->
    #   @set 'revealed', true
    @render()

  render: ->
 #   if @collection.scores()[0] isnt @collection.scores()[1] and @collection.scores()[1] <= 21    if
#
    isPlayer = !@collection.isDealer

    if isPlayer
      if @collection.hasAce() and @collection.scores()[1] <= 21
         high = ' or ' + @collection.scores()[1]
      else
         high = ''
    else # isDealer
      if @collection.hasAce() and @collection.at(0).get 'revealed' and @collection.scores()[1] <= 21
         high = ' or ' + @collection.scores()[1]
      else
         high = ''



    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()[0] + high
    # @$('.scoreLow').text @collection.scores()[0]
    # @$('.scoreHigh').text @collection.scores()[1] if @collection.scores()[1]?
