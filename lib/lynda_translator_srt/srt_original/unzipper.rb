require 'fileutils'

module LyndaTranslatorSrt
  module SrtOriginal
    class Unzipper
      attr_reader :path_unzip_folder

      def initialize(tmp_file_path)
        @tmp_file_path = tmp_file_path
      end

      def unzip
        name_unzip_folder = "srt_original_#{Time.now.utc.iso8601}"
        @path_unzip_folder = Dir.tmpdir + "/" + name_unzip_folder

        FileUtils::mkdir_p @path_unzip_folder

        @unzipped = system "unzip -o #{@tmp_file_path} -d #{@path_unzip_folder}"
        FileUtils::rm @tmp_file_path if unzipped?

        if unzipped?
          puts "Unzipped course"

          self
        else
          raise("Unfortunately we doesn't unzipped transcript to this course.")
        end
      end

      def unzipped?
        @unzipped
      end
    end
  end
end