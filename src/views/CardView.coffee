class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<img src="img/cards/<%= rankName %>-<%= suitName %>.png"></img>'

  events: 
    'change:revealed': -> @render()

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.html @template {'rankName': 'card', 'suitName': 'back'} unless @model.get 'revealed'

