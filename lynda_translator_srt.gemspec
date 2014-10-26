lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lynda_translator_srt/version'

Gem::Specification.new do |spec|
  spec.name          = 'lynda-translator-srt'
  spec.version       = LyndaTranslatorSrt::VERSION
  spec.authors       = ['Vadim Poplavskiy']
  spec.email         = ['im@demetrodon.com']
  spec.summary       = %q{Downloader and translator subs to coursers Lynda.com}
  spec.description   = ''
  spec.homepage      = 'https://github.com/demetrodon/lynda-translator-srt'
  spec.license       = 'New BSD'

  spec.files         = `git ls-files`.split($/)
  spec.require_paths = ['lib']
end
