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

      uid{ raw_info['account']['id'] }

      info do
        account_info = raw_info['account']
        subscription_info = account_info['subscription']
        
        {
          uid: account_info['id'],
          first_name: account_info['firstName'],
          last_name: account_info['lastName'],
          username: account_info['userName'],
          screen_name: account_info['screenName'],
          email: account_info['email'],
          country_code: account_info['country'],
          preferred_language: account_info['preferredLanguage'],
          parental_control_enabled: account_info['parentalControlEnabled'],
          subscription_state: subscription_info['state'].downcase.to_sym,
          subscription_suspended: subscription_info['isSuspended']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/v2.0/me/account').parsed
      end
    end
  end
end
