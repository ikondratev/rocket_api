module RocketApi
  module Commands
    module ShassiDir
      def shassi_config_ru!(_name)
        file_name = "config.ru"
        create_single_file(file_name, shassi_config_ru)
      end

      def shassi_gemfile!(_name)
        create_single_file("Gemfile", shassi_gemfile_text)
      end

      def shassi_rake_file!(_name)
        create_single_file("Rakefile", shassi_rake_text)
      end
    end
  end
end
