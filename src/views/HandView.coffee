# FIX MODEL NAME PLAYER NAME THING
class window.HandView extends Backbone.View
  className: 'hand'
  # name: 'Click to enter your name'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ } %> (<span class="score"></span>)</h2>'

  fun: ->
    @$el.addClass('bust')

  initialize: ->
    @collection.on 'add remove change', => @render()
    @collection.on 'bust', => @fun()
    @collection.on 'push', => @$el.addClass('draw')
    @collection.on 'lose', => @$el.addClass('lost')
    @collection.on 'CHRISCHRISCHRIS', => @$el.addClass('DING-DING-DING')
    @collection.on 'current', => @$el.toggleClass('current')
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text (@collection.score())

