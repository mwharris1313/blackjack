class window.CardView extends Backbone.View
  className: 'card'

  #template: _.template '<%= rankName %> of <%= suitName %>'
  #template: _.template '<img src="img/cards/10-clubs.png">'
  template: _.template ''

  initialize: -> @render()

  render: ->
    console.log @cardImg()
    @$el.children().detach()
    @$el.html @template @model.attributes
    #@$el.css('background', @cardImg())
    @$el.addClass 'covered' unless @model.get 'revealed'


  cardImg : ->
    rank = @model.get 'rankName'
      .toString()
      .toLowerCase()

    suit = @model.get 'suitName'
      .toString()
      .toLowerCase()

    fileName ="img/cards/" + rank + "-" + suit + ".png"
    if not @model.get 'revealed'
      fileName ="img/card-back.png"


    @template = _.template '<img src="' + fileName + '">'



