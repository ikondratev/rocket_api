module RocketApi
  module Commands
    module RackDir
      def rack_routes!(_name)
        dir_name = "app/constants"
        create_dir(dir_name)
        file_name = "#{dir_name}/routes.rb"
        create_single_file(file_name, rack_routes_text)
      end

      def rack_base_controller!(_name)
        dir_name = "app/controllers"
        create_dir(dir_name)
        file_name = "#{dir_name}/base_controller.rb"
        create_single_file(file_name, rack_base_controller_text)
      end

      def rack_config_ru!(_name)
        file_name = "config.ru"
        create_single_file(file_name, rack_config_ru)
      end

      def rack_app!(_name)
        dir_name = "config/app"

        create_dir(dir_name) unless is_exist?(dir_name)

        file_name = "#{dir_name}/app.rb"
        create_single_file(file_name, rack_app_text)
      end

      def rack_router!(_name)
        dir_name = "config/app"

        create_dir(dir_name) unless is_exist?(dir_name)

        file_name = "#{dir_name}/router.rb"
        create_single_file(file_name, rack_router_text)
      end

      def rack_initializers!(_name)
        dir_name = "config/initializers"

        create_dir(dir_name) unless is_exist?(dir_name)

        file_name = "#{dir_name}/001_settings.rb"
        create_single_file(file_name, rack_initializers_text)
      end

      def rack_application!(_name)
        file_name = "config/application.rb"
        create_single_file(file_name, rack_application_text)
      end

      def rack_gemfile!(_name)
        create_single_file("Gemfile", rack_gemfile_text)
      end
    end
  end
end
