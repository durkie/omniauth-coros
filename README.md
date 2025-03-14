# Omniauth-Coros

This is a Omniauth Rubygem for authenticating users with Coros.

## Installation

Add to your Gemfile:

```
gem "omniauth-coros"
```

Run `bundle install` afterwards.


To ``config/initializers/omniauth.rb`` add:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :coros, Rails.application.secrets.coros_client_id, Rails.application.secrets.coros_api_key
end
```

Please refer to the [Omniauth documentation](https://github.com/intridea/omniauth) on how to use Omniauth.
