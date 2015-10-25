$(document).ready( =>
  numPlayers = prompt("HOW MANY PLAYAS YOU GOT");
  while numPlayers > 5
    numPlayers = prompt("Ayo dawg, you's be rollin too deep for this table, bruh. How many playas you got?")
  new AppView(model: new App(numPlayers)).$el.appendTo 'body'
)