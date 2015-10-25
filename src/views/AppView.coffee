class window.AppView extends Backbone.View

  className: 'appView'

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="dealer-hand-container"></div>
    <div class="players-container"></div>
  '

  events:
    'click .hit-button': -> 
      if @model.get('currentGame').get('currentPlayer').hit() >= 21
        @endPlayer()
    'click .stand-button': -> @endPlayer()

  initialize: ->
    @render()
    @.model.get('currentGame').firstPlayer()

  endPlayer: ->
    @model.get('currentGame').setPlayerScore(@model.get('currentGame').get('currentPlayer').score())
    @model.get('currentGame').changeCurrentPlayer()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.dealer-hand-container').html new HandView(collection: @model.get('currentGame').get 'dealerHand').el
    for player,ind in @model.get('currentGame').get('players')
      @$('.players-container').append new HandView(collection: player).el

