require 'pathname'

module LyndaTranslatorSrt
  module SrtOriginal
    class Reader
      attr_reader :root_folder_path, :root_folder_name, :list_path_srt_files

      def initialize(path_unzip_folder)
        @path_unzip_folder = path_unzip_folder
      end

      def create_list_path_srt_files
        @list_path_srt_files = []

        pathname = Pathname.new @path_unzip_folder

        @root_folder_path = pathname.children.first.to_s
        @root_folder_name = pathname.children.first.basename

        collect_srt pathname

        puts "Created list path srt files"

        self
      end

      private

      def collect_srt(path)
        path.each_child do |child|
          if child.file?
            @list_path_srt_files << child.to_s
          elsif child.directory?
            collect_srt(child) + [child]
          end
        end
      end
    end
  end
end