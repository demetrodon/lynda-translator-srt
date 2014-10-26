require 'lynda_translator_srt/srt_original/downloader'
require 'lynda_translator_srt/srt_original/reader'
require 'lynda_translator_srt/srt_original/unzipper'
require 'lynda_translator_srt/zipper'
require 'translator_srt/google_translate'

module LyndaTranslatorSrt
  LANG_LYNDA_SUBS = 'en'

  def self.translate(course_url, to_lang, path_to_zip)
    srt_downloader = SrtOriginal::Downloader.new(course_url).download_zip_original_srt

    srt_unzipper = SrtOriginal::Unzipper.new(srt_downloader.tmp_file_path).unzip

    srt_reader = SrtOriginal::Reader.new(srt_unzipper.path_unzip_folder).create_list_path_srt_files

    srt_reader.list_path_srt_files.each do |srt_path|
      translated_srt = TranslatorSrt::GoogleTranslate.translate_srt_file LANG_LYNDA_SUBS, to_lang, srt_path
      File.write srt_path, translated_srt
    end

    params_zipper = {
        path_unzip_folder: srt_unzipper.path_unzip_folder,
        root_folder_path: srt_reader.root_folder_path,
        root_folder_name: srt_reader.root_folder_name,
        save_to: path_to_zip
    }

    srt_zipper = Zipper.new(params_zipper).zip

    srt_zipper.zipname
  end
end