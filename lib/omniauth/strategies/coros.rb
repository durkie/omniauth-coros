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

      def build_access_token
        token_response = super
        response_body = token_response.params
        @open_id = response_body['openId']
        token_response
      end

      def uid
        @open_id
      end

      def raw_info
        @raw_info ||= access_token.get("/coros/userinfosim?token=#{access_token.token}&openId=#{@open_id}").parsed
      end

      extra do
        { raw_info: raw_info, open_id: @open_id }
      end
    end
  end
end
