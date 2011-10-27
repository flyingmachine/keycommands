class KeyRouter
  keyDown: (event) ->
   keystroke = new Keystroke event
   switch(keystroke.toString())
     when 'TAB'
       # change focus
     when 'apple-R'
       #refresh
     else
       keyCommand.addKeystroke(keystroke)

class KeyCommand
  constructor: ->
    @keystrokes  = []
    @description = ''

  addKeystroke: (event) =>
    @keystrokes.push keystroke
    @render()
    false

  render: =>
    $('#key_events').text @toString()
    
  toString: => 
    (keystroke.toString() for keystroke in @keystrokes).join ' '

class Keystroke
  constructor: (event) ->
    @keycode = event.which
    #@modifiers = modifiers_from(event)
  #modifiers_from: (event) ->

  toString: =>
    String.fromCharCode(@keycode) 

keyCommand = new KeyCommand

$(window).keydown KeyRouter.keyDown

