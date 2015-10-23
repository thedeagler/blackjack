class window.AppView extends Backbone.View

  className: 'appView'

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('currentGame').get('playerHand').hit()
    'click .stand-button': -> @model.get('currentGame').get('playerHand').stand()

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get('currentGame').get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get('currentGame').get 'dealerHand').el

