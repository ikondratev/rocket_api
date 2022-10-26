module RocketApi
  module Library
    module ShassiRepoPlainText
      def shassi_config_ru
        ["require_relative \"config/environment\"\n",
         "use Rack::PostBodyContentTypeParser\n",
         "run Rack::URLMap.new(\"/app\" => AppRoutes)"].join("\n")
      end

      def shassi_rake_text
        ["ENV[\"RACK_ENV\"] ||= \"development\"\n",
         "Rake.add_rakelib(\"rakelib/**\")"].join("\n")
      end

      def shassi_gemfile_text
        ["source 'https://rubygems.org'\n",
         "ruby 'RUBY_VERSION'\n",
         "gem 'rake'",
         "gem 'rack-contrib'",
         "gem 'puma'\n",
         "gem 'sinatra'",
         "gem 'sinatra-contrib'\n",
         "gem 'i18n'",
         "gem 'config'\n",
         "gem 'pg'",
         "gem 'sequel'",
         "gem 'sequel-seed'\n",
         "gem 'dry-initializer'",
         "gem 'dry-validation'\n",
         "gem 'fast_jsonapi'\n",
         "gem 'rubocop'",
         "gem 'rubocop-rake'\n",
         "group :test do",
         "#{TAB}gem 'ruby-debug-ide'",
         "#{TAB}gem 'debase'",
         "#{TAB}gem 'rspec'",
         "#{TAB}gem 'factory_bot'",
         "#{TAB}gem 'rack-test'",
         "#{TAB}gem 'database_cleaner-sequel'",
         "end"].join("\n")
      end
    end
  end
end
