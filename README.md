# Skeleton Rails
skeleton\_rails is a simple gem that allows you to generate a layout file based on the awesome [Skeleton](http://getskeleton.com) in your rails application. It currently works with Rails 3.0.0 and later. 

# Installation

    gem install skeleton_rails

or in your Gemfile

    gem 'skeleton_rails'

Then, to create the layout:

    rails g skeleton_layout NAME

`NAME` is optional and defaults to `application`. The generator will copy a layout file to the app/views/layouts directory, as well as copying the stylesheets, javascript, and image files to their respective locations.  Skeleton also includes a 404.html and a robots.txt file.

# Future
* I hope to add a haml option in the very near future.

# Credit
Thanks to Dave Gamache for making Skeleton, and thanks to Ryan Bates for making Nifty Generators, which I basically just copied to make the structure for this gem.

