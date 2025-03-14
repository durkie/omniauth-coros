# frozen_string_literal: true

require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Coros < OmniAuth::Strategies::OAuth2
      option :name, 'coros'
      option :client_options, {
        :site => 'https://open.coros.com/',
        :authorize_url => 'https://open.coros.com/oauth2/authorize',
        :token_url => 'https://open.coros.com/oauth2/accesstoken'
      }

      uid { raw_info['user']['id'] }

      def raw_info
        @raw_info ||= access_token.get('/coros/userinfosim').parsed
      end
    end
  end
end
