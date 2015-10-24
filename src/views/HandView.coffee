class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>@model.name<% } %> (<span class="score"></span>)</h2>'

  events:
    'CHRISCHRISCHRIS': -> console.log('what')
    # @$el.addClass('winnerizationator')
    'wahwah': -> console.log('what')
    # @$el.addClass('wah-wah-you-lose')

  fun: ->
    @$el.addClass('bust')

  initialize: ->
    @collection.on 'add remove change', => @render()
    @collection.on 'bust', => @fun()
    @collection.on 'wahwah', => @$el.addClass('sux2sux')
    @collection.on 'CHRISCHRISCHRIS', => @$el.addClass('DING-DING-DING')
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text (@collection.score())

