class KeyRouter
  constructor: ->
    @keyCommand = new KeyCommand
    $(window).keydown @keyDown
    
  keyDown: (event) =>
    keystroke = new Keystroke event
    console.log keystroke.toString()
    console.log event
    console.log keystroke.keycode
    
    switch(keystroke.toString())
      when 'tab'
        console.log "got a tab!"
      when 'meta R'
        true
      else
        @keyCommand.addKeystroke(keystroke)

class KeyCommand
  constructor: ->
    @keystrokes  = []
    @description = ''

  addKeystroke: (keystroke) =>
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
    @modifiers = @modifiersFrom(event)
  modifiersFrom: (event) ->
    modifiers = []
    modifiers.push "alt"  if event.altKey
    modifiers.push "ctrl" if event.ctrlKey
    modifiers.push "meta" if event.metaKey
    modifiers.push "shift" if event.shiftKey
    modifiers

  toString: =>
    
    switch @keycode
      when 9 then 'tab'
      else
        "#{@modifiers.join("+")} #{String.fromCharCode(@keycode)}"

new KeyRouter