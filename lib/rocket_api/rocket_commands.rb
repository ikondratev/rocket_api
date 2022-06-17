require './rocket_api/constants'
require './rocket_api/commands/files'
require './rocket_api/commands/dirs'
require './rocket_api/library/gem_repo_plain_text'

module RocketApi
  class RocketCommands
    extend RocketApi::Commands::Files
    extend RocketApi::Commands::Dirs
    extend RocketApi::Library::GemRepoPlainText

    def self.init_gem_dir
      create_repo(RocketApi::GEM_PROJECTS_DIR)
    end

    def self.init_gem_files(project_name)
      raise RocketApi::EMPTY_NAME if project_name.nil?

      init_bin!(project_name)
      init_gemspec!(project_name)
      init_main_file!(project_name)
      init_version!(project_name)
      init_gitignore!
    rescue StandardError => e
      puts "#{RocketApi::INIT_FAIL} #{e.message}"
    end

    def self.init_bin!(name)
      dir_name = "bin/#{name}"
      create_single_file(
        dir_name,
        "",
        exe: true
      )
    end

    def self.init_version!(name)
      dir_name = "lib/#{name}"
      create_dir(dir_name)

      file_name = "#{dir_name}/version.rb"
      create_single_file(
        file_name,
        plain_version_text(class_name_camel(name))
      )
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
      create_single_file(
        file_name,
        plain_gemspec_text(name, class_name_camel(name))
      )
    end
  end
end
