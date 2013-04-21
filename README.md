## Image Based Authentication For Devise

Allows your users to create an image based key that they must select after entering their usual email/password for added security.

## Prerequistes

If you wish to use the locking feature of this extension ensure you have already enable Devise's lockable module.

## Configuration

Add the gem to your Gemfile:

    gem 'image_auth'

Now bundle:

    bundle install

To add the require migration and configuration to your model, run:

    bundle exec rails g image_auth MODEL

Now run the migration

    bundle exec rake db:migrate

To enable locking, in your devise initializer set

    config.lock_after_failed_attempts = true

The number of failed attempts is set using

    config.maximum_attempts = 3

And the number of images available to select is set using:

    config.maximum_categories = 3

This defaults to 3

## Credits

Originally developed for [www.strongcoin.com](https://www.strongcoin.com)