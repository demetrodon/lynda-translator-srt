require 'net/http'
require 'open-uri'

module LyndaTranslatorSrt
  module SrtOriginal
    class Downloader
      LYNDA_SRT_SERVICE_URL = 'http://www.lyndasub.ir/g/'

      attr_reader :url_course, :link_original_srt, :tmp_file_path

      def initialize(url_course)
        @url_course = url_course
      end

      def download_zip_original_srt
        load_link_zip_original_srt
        raise ArgumentError, "Unfortunately we doesn't load transcript to this course." if @link_original_srt.nil?

        tmp_file_name = "srt_original_at_"
        tmp_file = Tempfile.new(tmp_file_name)
        @tmp_file_path = tmp_file.path

        File.open(tmp_file.path, "wb") do |saved_file|
          # the following "open" is provided by open-uri
          open(@link_original_srt, "rb") do |read_file|
            saved_file.write(read_file.read)
          end
        end

        self
      end

      private

      def load_link_zip_original_srt
        uri = URI(LYNDA_SRT_SERVICE_URL + @url_course)

        res = Net::HTTP.get_response(uri)

        @link_original_srt = res.body if res.is_a?(Net::HTTPSuccess)
      end
    end
  end
end