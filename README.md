## Image Based Authentication For Devise

[![Build Status](https://travis-ci.org/invisiblelines/image_authentication.png?branch=master)](https://travis-ci.org/invisiblelines/image_authentication)
[![Code Climate](https://codeclimate.com/github/invisiblelines/image_authentication.png)](https://codeclimate.com/github/invisiblelines/image_authentication)
[![Dependency Status](https://gemnasium.com/invisiblelines/image_authentication.png)](https://gemnasium.com/invisiblelines/image_authentication)


Allows your users to create an image based key that they must select after entering their usual email/password for added security.

## Prerequistes

If you wish to use the locking feature of this extension ensure you have already enable Devise's lockable module.

## Configuration

Add the gem to your Gemfile:

    gem 'image_authentication'

Now bundle:

    bundle install

To add the require migration and configuration to your model, run:

    bundle exec rails g image_authentication MODEL

Now run the migration

    bundle exec rake db:migrate

To enable locking, in your devise initializer set

    config.lock_after_failed_attempts = true

The number of failed attempts is set using

    config.maximum_attempts = 3

And the number of images available to select is set using:

    config.maximum_categories = 3

This defaults to 3

You'll now want to provide a link to 'enable_user_image_authentication_path' to user's can set their images and enable this.
You will also want to provide another link to 'disable_user_image_authentication_path' so a user can disable image authentication.

## Credits

Originally developed for [www.strongcoin.com](https://www.strongcoin.com)
