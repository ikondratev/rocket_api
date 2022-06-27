require "rocket_api/constants"

module RocketApi
  module Library
    module RackRepoPlainText
      def rack_routes_text
        ["module Constants",
         "\s\smodule Routes",
         "\s\s\s\sPING = \"/ping.json\".freeze",
         "\s\s\s\sMESSAGE_COUNT = \"/greeting.json\".freeze",
         "\s\send",
         "end"].join("\n")
      end

      def rack_base_controller_text
        ["class BaseController",
         "\s\sdef initialize(request)",
         "\s\s\s\s@request = request",
         "\s\send\n",
         "\s\sdef ping",
         "\s\s\s\sbuild_response(\"pong\")",
         "\s\send\n",
         "\s\sprivate\n",
         "\s\sdef build_response(body, status: 200)",
         "\s\s\s\s[status, { \"Content-Type\" => \"text/json\" }, [body]]",
         "\s\send",
         "end"].join("\n")
      end

      def rack_config_ru
        ["require_relative \"config/application\"",
         "require_all \"./config/app\"\n",
         "secret_key = SecureRandom.hex(32)",
         "use Rack::Session::Cookie, secret: secret_key, same_site: true, max_age: 86400\n",
         "run Rack::URLMap.new('/' => Rack::Builder.new { run App.new })"].join("\n")
      end

      def rack_app_text
        ["class App",
         "#{TAB}def call(env)",
         "#{DOUBLE_TAB}request = Rack::Request.new(env)",
         "#{DOUBLE_TAB}serve_request(request)",
         "#{TAB}end\n",
         "#{TAB}def serve_request(request)",
         "#{DOUBLE_TAB}Router.new(request).route!",
         "#{TAB}end",
         "end"].join("\n")
      end

      def rack_router_text
        ["class Router",
         "#{TAB}def initialize(request)",
         "#{DOUBLE_TAB}@request = request",
         "#{TAB}end\n",
         "#{TAB}def route!",
         "#{DOUBLE_TAB}return controller.not_found unless @request.post?\n",
         "#{DOUBLE_TAB}case @request.path",
         "#{DOUBLE_TAB}when Constants::Routes::PING",
         "#{DOUBLE_TAB}#{TAB}controller.ping",
         "#{DOUBLE_TAB}else",
         "#{DOUBLE_TAB}#{TAB}controller.not_found",
         "#{DOUBLE_TAB}end",
         "#{TAB}end\n",
         "#{TAB}private\n",
         "#{TAB}def controller",
         "#{DOUBLE_TAB}@controller ||= BaseController.new(@request)",
         "#{TAB}end\n",
         "#{TAB}def params",
         "#{DOUBLE_TAB}JSON.parse(@request.body.read)",
         "#{TAB}end",
         "end"].join("\n")
      end

      def rack_initializers_text
        ["# frozen_string_literal: true\n",
         "require \"config\"\n",
         "Config.setup do |config|",
         "#{TAB}config.const_name = \"Settings\"",
         "#{TAB}config.use_env = false",
         "end\n",
         "env = ::ActiveSupport::StringInquirer.new(ENV[\"RACK_ENV\"] || \"development\")",
         "path = Dir.pwd << (\"/config\")",
         "Config.load_and_set_settings(Config.setting_files(path, env))\n",
         "Settings.env = env"].join("\n")
      end

      def rack_application_text
        ["# frozen_string_literal: true\n",
         "# require gems",
         "require \"bundler\"",
         "Bundler.require(:default, ENV[\"RACK_ENV\"] || \"development\")\n",
         "require \"simplecov\" if ENV[\"COVERAGE\"]\n",
         "# require additional gem files",
         "require \"active_support/all\"\n",
         "# initialize application, logger, gems, etc.",
         "require_all \"config/initializers\"\n",
         "# require application\n",
         "require_all \"app\""].join("\n")
      end

      def rack_gemfile_text
        ["source 'https://rubygems.org/'",
         "ruby 'RUBY_VERSION'\n",
         "gem 'rack', 'VERSION'",
         "gem 'rack-parser'",
         "gem 'rake', 'VERSION'",
         "gem 'require_all', '~> VERSION'",
         "gem 'activesupport', '~> VERSION'",
         "gem 'config', '~> VERSION'"].join("\n")
      end
    end
  end
end
