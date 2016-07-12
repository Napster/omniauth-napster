require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Napster < OmniAuth::Strategies::OAuth2
      include OmniAuth::Strategy
      option :name, 'napster'

      option :client_options, {
        :site          => 'https://api.napster.com',
        :token_url     => '/oauth/access_token'
      }

      uid{ raw_info['me']['id'] }

      info do
        {
          :uid => raw_info['me']['id'],
          :name => raw_info['me']['realName'],
          :username => raw_info['me']['screenName'],
          :image => raw_info['me']['avatar']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/me').parsed
      end
    end
  end
end
