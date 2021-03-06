module RocketApi
  module Commands
    module GemsDir
      # @param [String] name
      def gems_version!(name)
        dir_name = "lib/#{name}"
        create_dir(dir_name)
        file_name = "#{dir_name}/version.rb"
        create_single_file(file_name, plain_version_text(class_name_camel(name)))
      end

      # @param [String] name
      def gems_main_file!(name)
        file_name = "lib/#{name}.rb"
        text = "class #{class_name_camel(name)}; end"
        create_single_file(file_name, text)
      end

      # @param [String] name
      def gemspec!(name)
        file_name = "#{name}.gemspec"
        create_single_file(file_name, plain_gemspec_text(name, class_name_camel(name)))
      end

      # @param [String] name
      def gem_test!(name)
        file_name = "test/test_version.rb"
        create_single_file(file_name, plain_gem_test_version_text(name, class_name_camel(name)))
      end

      def rubocop_yml!(name)
        file_name = ".rubocop.yml"
        create_single_file(file_name, plain_rubocop_yml_text(name))
      end
    end
  end
end
