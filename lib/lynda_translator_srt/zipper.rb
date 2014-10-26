require 'fileutils'

module LyndaTranslatorSrt
  class Zipper
    attr_reader :zipname

    def initialize(params)
      @params = params
    end

    def zip
      @zipname = "#{@params[:root_folder_name]}.zip"
      path_zipfile = @params[:save_to] + @zipname

      @zipped = system "7z a -tzip #{path_zipfile} -w #{@params[:root_folder_path]}"
      puts @params[:root_folder_path]

      cleaner if zipped?

      if zipped?
        puts "Zipped course"

        self
      else
        raise("Unfortunately we doesn't zipped transcript to this course.")
      end
    end

    def zipped?
      @zipped
    end

    private

    def cleaner
      FileUtils::rm_r @params[:path_unzip_folder]
    end
  end
end