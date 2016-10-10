require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class TerritorialManagementAuth < OmniAuth::Strategies::OAuth2
      option :name, "ctigi_auth"
      option :client_options, {
        site:          Figaro.env.ctigi_auth_app_url,
        authorize_url: "/oauth/authorize"
      }

      option :authorize_params, { layout: "login" }

      uid { raw_info["user"]["territorial_management_auth_uid"] }

      info do
        {
          email: raw_info["user"]["email"],
          first_name: raw_info['user']['person']['name'],
          last_name: raw_info['user']['person']['last_name'],
          avatar_full_path: raw_info['user']['person']['avatar_full_path']
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        raw_info ||= access_token.get("/api/v1/credentials/me").parsed
      end

      def callback_url
        super
      end
    end
  end
end
