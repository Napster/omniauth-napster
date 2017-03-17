<!--
[![Gem Version](https://badge.fury.io/rb/omniauth-napster.svg)](https://badge.fury.io/rb/omniauth-napster)
-->

# Napster Music OmniAuth Strategy

This gem provides the [OmniAuth](https://github.com/intridea/omniauth) strategy for the [Napster API](https://developer.napster.com).

## Installation

Add this line to your application's Gemfile:

```$ gem 'omniauth-napster', git: 'https://github.com/mrj/omniauth-napster.git'```

And then execute:

```$ bundle```

Or install it yourself as:

```$ gem install omniauth-napster, git: 'https://github.com/mrj/omniauth-napster.git'```

## Usage

You'll need to register your app with Napster.  Visit https://developer.napster.com/developer/apps/new to get started.

Using this gem is similar to other OmniAuth strategies.  Add your app credentials to `config/initializers/omniauth.rb`:

```ruby
keys = Rails.application.secrets

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :napster, keys.napster['api_key'], keys.napster['api_secret']
end
```

Or with Devise in `config/initializers/devise.rb`:

```ruby
keys = Rails.application.secrets

config.omniauth :napster, keys.napster['api_key'], keys.napster['api_secret']
```

## Auth Schema

`request.env['omniauth.auth'].auth` responds to the methods `token`, `refresh_token`, `expires_at` (Unix time), and `expires?` (true for Napster).

Here's an example info hash, available in `request.env['omniauth.auth'].info`:

```ruby
{
  uid: '295DC739BEDA4BB8E050960A380358BC',
  first_name: 'Testy',
  last_name: 'Testerson',
  username: 'testy@example.com',
  screen_name: 'Reatta3634',
  email: 'testy@example.com',
  country_code: 'US',
  preferred_language: 'en_US',
  parental_control_enabled: false,
  subscription_state: :expired      # :expired, :trial, or :paying
  subscription_suspended: false
}
```

Further information is available in `request.env['omniauth.auth'].raw_info`:

```ruby
{
  "account" => {
    "id" => "295DC739BEDA4BB8E050960A380358BC",
    "type" => "account",
    "href" => "https://api.napster.com/v2.0/me/account",
    "created" => "2016-11-21T12:06:45.000Z",
    "cobrand" => "40134",
    "cocat" => "40134:101:en_US",
    "originCode" => "napi",
    "email" => "testy@example.com",
    "country" => "US",
    "zip" => nil,
    "locale" => "en_US",
    "userName" => "testy@example.com",
    "firstName" => "Testy",
    "lastName" => "Testerson",
    "screenName" => "Reatta10117",
    "nonDmcaRadioUser" => true,
    "parentalControlEnabled" => false,
    "isPublic" => true,
    "isCurrentSubscriptionPayable" => false,
    "scrobblingEnabled" => false,
    "preferredLanguage" => "en_US",
    "screenNameAutoCreated" => "true",
    "subscription" => {
      "id" => "",
      "billingPartnerCode" => "Rhapsody",
      "catalog" => "101",
      "createDate" => "2016-11-21T12:06:45.000Z",
      "isSuspended" => false,
      "tierCode" => "R25",
      "tierName" => "",
      "productCode" => "",
      "productName" => "",
      "productServiceTerm" => "",
      "expirationDate" => 0,
      "trialLengthDays" => 0,
      "isTrial" => false,
      "state" => "EXPIRED"
    },
    "entitlements" => {
      "canStreamOnWeb" => false,
      "canStreamOnMobile" => false,
      "canStreamOnHomeDevice" => false,
      "canStreamOnPC" => false,
      "canUpgradeStreams" => true,
      "canPlayPremiumRadio" => false,
      "maxStreamCount" => 0,
      "isPlayBasedTier" => false,
      "isMonthlyPlayBasedTier" => false,
      "isOneTimePlayBasedTier" => false,
      "totalPlays" => nil,
      "playsRemaining" => nil,
      "skipLimit" => 6,
      "skipLimitMinutes" => 60
    }
  }
}
```

## More

The original omniauth-napster gem was brought to you by the NAPI (Napster API) development team.  Please [reach out to us](https://groups.google.com/forum/#!forum/rhapsody-api) if you have any questions.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
