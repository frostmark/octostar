require './config/environment'

require 'web_bouncer'
require 'web_bouncer/oauth_middleware'
require './lib/auth/oauth'

use Rack::Session::Cookie, secret: ENV['WEB_SESSIONS_SECRET']

use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], provider_ignores_state: true
end

use WebBouncer['middleware.oauth'], { model: :account }
run Hanami.app
