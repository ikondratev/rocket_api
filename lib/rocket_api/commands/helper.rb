module RocketApi
  module Commands
    module Helper
      def init_bin!(name)
        dir_name = "bin/#{name}"
        create_single_file(
          dir_name,
          "",
          exe: true
        )
      end

      def init_gitignore!
        file_name = ".gitignore"
        create_single_file(
          file_name,
          gitignore_text
        )
      end
    end
  end
end
