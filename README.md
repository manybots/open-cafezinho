# Cafézinho - Open Version

Cafézinho is a Manybots application that enables you (and your users) to track their coffee consumption.

This Open version is intended to serve as an example of a Manybots application.

## Getting Started

You need to have Rails 3.1 installed and running on your system

- Setup a new OAuth application on [Manybots.com](https://www.manybots.com/oauth_clients/new).
- Copy-paste the client consumer and secret into `config/initializers/01_coffeecounter.rb` and edit the admin email to match your Manybots account email
- Run `bundle install`
- Run `rails g cafezinho:install`
- Run `bundle exec rake db:migrate`

## Help

- [Manybots API - Getting started with Ruby on Rails 3.1, Devise and Omniauth](https://www.manybots.com/developers/rails)
- [Manybots Developers mailing list](http://groups.google.com/group/manybots-dev?pli=1)

## License

(c) 2011 Manybots IT Lda