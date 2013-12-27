# Pebble Quick Configuration Website

[Pebble](https://developer.getpebble.com/)'s new [2.0 SDK](https://developer.getpebble.com/2/) supports convenient app configurations.  Setting up a configuration page currently requires setting up a web page with some light Javascript.  This page allows configuration pages to be easily templated with simple GET requests.

## Example
[Click here to see an example.](http://pebble-config.herokuapp.com/config?title=Quick%20Config&fields=email_Username,password_Pass)

    http://pebble-config.herokuapp.com/config?title=Quick%20Config&fields=email_Username,password_Pass

## Sample App
The `quick-config-sample` directory hosts an 2.0 SDK [PebbleJS](http://developer.getpebble.com/2/guides/javascript-guide.html) app that uses [AppMessage](http://developer.getpebble.com/2/api-reference/group___app_message.html) to pass configuration values back to PebbleOS.  After the configuration screen is saved, it will present the username in the middle of the Pebble screen.

## Hosting
Currently this is hosted at <http://pebble-config.herokuapp.com/config>, but you can clone it and place it anywhere you like!

## Query Params
Currently there are only two query params:

1. title: a URL encoded title to be displayed at the top of the screen
2. fields: a comma seperated list of fields to display. If the string contains an underscore (*_*), the text preceeding the underscore will be used as the input field type. This is useful for things like *email* or *password*.

## Screenshot
![](img/screenshot.PNG)
