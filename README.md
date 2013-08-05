# Sinatra Application Boilerplate for Heroku

A simple boilerplate `sinatra` application skeleton for quick deployment to Heroku.


## Libraries

* [http://getbootstrap.com/][1]
* [http://glyphicons.getbootstrap.com/][2]
* [http://fontawesome.io/][3]

## Requirements

* Default ruby version is `1.9.3-p448` via `rbenv`

## Installation

You can install required `gem` files via;

    bundle install --path vendor/bundle

You can define your **Amazon S3 Bucket** information and **Google Analytics ID**
in the `config/prefs.yml`. Use the `<%= @s3_prefix %>` tag in your templates aka `views`

Example data generates `http://foobar.s3.amazonaws.com/public` as prefix. Put
all your static data you Amazon S3. Example usage `views/layout.erb`:

    <link rel="stylesheet" href="<%= @s3_prefix %>/vendor/bootstrap3/glyphicon/bootstrap-glyphicons.css">

When you are running development server via `rake` or `rake run:development` it
generates an empty string for `<%= @s3_prefix %>` and example above becomes:

    <link rel="stylesheet" href="/vendor/bootstrap3/glyphicon/bootstrap-glyphicons.css">

and uses your local `public/` folder. You can run server in a production mode via
`rake run:production`. Don't forget, google analytics code will be shown only
in **production** mode.

You can display all the rake tasks via `rake -T`

[1]: http://getbootstrap.com/
[2]: http://glyphicons.getbootstrap.com/
[3]: http://fontawesome.io/