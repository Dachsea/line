App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    Notification.requestPermission()

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    notification = new Notification "You got a new Message"
    $('#messages').append data['message']

  speak: (message) ->
    @perform 'speak', message: message

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    current_room = window.location.href.slice(window.location.href.lastIndexOf('/')+1)
    data = {current_room: parseInt(current_room), message: event.target.value}
    App.room.speak data
    event.target.value = ''
    event.preventDefault()