class window.AppView extends Backbone.View

  className: 'appView'

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="dealer-hand-container"></div>
    <div class="players-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('currentGame').get('currentPlayer').hit()
    'click .stand-button': -> @newRound()

  initialize: ->
    @render()

  newRound: ->
    @model.get('currentGame').get('currentPlayer').stand()
    @model.get('currentGame').setPlayerScore(@model.get('currentGame').get('currentPlayer').scores())
    @model.get('currentGame').changeCurrentPlayer()
    # @listenTo(@get('currentPlayer'), 'stand', @changeCurrentPlayer)


  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.dealer-hand-container').html new HandView(collection: @model.get('currentGame').get 'dealerHand').el
    for player,ind in @model.get('currentGame').get('players')
      @$('.players-container').append new HandView(collection: player).el

    # @model.get('currentGame').get('players').each( (player) -> 

    #   )

