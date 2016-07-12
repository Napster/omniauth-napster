<!--
[![Gem Version](https://badge.fury.io/rb/omniauth-napster.svg)](https://badge.fury.io/rb/omniauth-napster)
-->

# Napster Music OmniAuth Strategy

This gem provides the [OmniAuth](https://github.com/intridea/omniauth) strategy for the [Napster API](https://developer.napster.com).

## Installation

Add this line to your application's Gemfile:

```$ gem 'omniauth-napster'```

And then execute:

```$ bundle```

Or install it yourself as:

```$ gem install omniauth-napster```

## Usage

You'll need to register your app with Napster.  Visit https://developer.napster.com/developer/apps/new to get started.

Using this gem is similar to other OmniAuth strategies.  Add your app credentials to `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :napster, ENV['NAPSTER_API_KEY'], ENV['NAPSTER_API_SECRET']
end
```

Or with Devise in `config/initializers/devise.rb`:

```ruby
config.omniauth :napster, ENV['NAPSTER_API_KEY'], ENV['NAPSTER_API_SECRET']
```

## Auth Hash Schema

Here's an example auth hash, available in `request.env['omniauth.auth']`:
```
{
  "provider":"napster",
  "uid":"295DC739BEDA4BB8E050960A380358BC",
  "info": {
    "uid":"295DC739BEDA4BB8E050960A380358BC",
    "name":"Testy Testerson",
    "username":"NAPIcat",
    "image":"http://direct.rhapsody.com/imageserver/v2/external/aHR0cHM6Ly9yaGFwc29keS1uYXBpLnMzLmFtYXpvbmF3cy5jb20vbWVtYmVyLzI5NURDNzM5QkVEQTRCQjhFMDUwOTYwQTM4MDM1OEJDL2F2YXRhci9vcmlnaW5hbA%3D%3D/images/108x108.jpg"
  },
  "credentials": {
    "token":"NTQ3NjI5NDktNWIyZC00MDVlLTg2MDMtZDhhMGQ2YTYzMTk3",
    "refresh_token":"0b4bdad8-1c82-44d0-8cdb-dd8d2b6e6331",
    "expires_at":1463103543,
    "expires":true
  },
  "extra": {
    "raw_info": {
      "me": {
        "id": "295DC739BEDA4BB8E050960A380358BC",
        "realName": "Testy Testerson",
        "screenName": "NAPIcat",
        "bio": "The cat is back!",
        "location":"Seattle, WA",
        "visibility": "public",
        "type": "member",
        "href": "http://api.rhapsody.com/members/295DC739BEDA4BB8E050960A380358BC",
        "favoriteAlbumsCount": 0,
        "favoriteArtistsCount": 0,
        "favoriteTracksCount": 0,
        "playlistsTotalCount": 0,
        "playlistsPublishedCount": 0,
        "stationsCount": 0,
        "radioCount": 0,
        "followingCount": 2,
        "followerCount": 10,
        "avatar": "http://direct.rhapsody.com/imageserver/v2/external/aHR0cHM6Ly9yaGFwc29keS1uYXBpLnMzLmFtYXpvbmF3cy5jb20vbWVtYmVyLzI5NURDNzM5QkVEQTRCQjhFMDUwOTYwQTM4MDM1OEJDL2F2YXRhci9vcmlnaW5hbA%3D%3D/images/108x108.jpg",
        "avatarId": "aHR0cHM6Ly9yaGFwc29keS1uYXBpLnMzLmFtYXpvbmF3cy5jb20vbWVtYmVyLzI5NURDNzM5QkVEQTRCQjhFMDUwOTYwQTM4MDM1OEJDL2F2YXRhci9vcmlnaW5hbA%3D%3D",
        "defaultAvatar": "false",
        "avatarVersion": 1465508896140
      }
    }
  }
}
```

## More

This gem is brought to you by the NAPI (Napster API) development team.  Please [reach out to us](https://groups.google.com/forum/#!forum/rhapsody-api) if you have any questions.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
