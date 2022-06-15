require './rocket_api/constants'
require './rocket_api/commands/files'
require './rocket_api/commands/dirs'

module RocketApi
  class RocketCommands
    extend RocketApi::Commands::Files
    extend RocketApi::Commands::Dirs

    def self.init_gem_dir
      create_repo(RocketApi::GEM_PROJECTS_DIR)
    end

    def self.init_gem_files(project_name)
      raise "Project name is empty" if project_name.nil?

      init_gemspec!(project_name)
      init_main_file!(project_name)
      init_version!(project_name)
      init_gitignore!
    rescue StandardError => e
      puts "Init action fail: #{e.message}"
    end

    def self.init_version!(name)
      dir_name = "lib/#{name}"
      create_dir(dir_name)

      file_name = "#{dir_name}/version.rb"
      text = "module #{class_name_camel(name)}\nVERSION = \"0.0.1\".freeze\nend"
      create_single_file(file_name, text)
    end

    def self.init_main_file!(name)
      file_name = "lib/#{name}.rb"
      text = "class #{class_name_camel(name)}; end"
      create_single_file(file_name, text)
    end

    def self.init_gitignore!
      file_name = ".gitignore"
      text = ".idea/\nGemfile.lock\n*.gem"
      create_single_file(file_name, text)
    end

    def self.init_gemspec!(name)
      file_name = "#{name}.gemspec"
      text = "require '#{name}/version'"
      create_single_file(file_name, text)
    end
  end
end
