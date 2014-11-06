# lynda-translator-srt

This is a Ruby library for translate the transcript courses lynda.com to other languages.
Current functionality includes **Google Translate**.

## Installation

Add this line to your application's Gemfile:

    gem 'lynda-translator-srt'

Or add latest version from github:

    gem 'lynda-translator-srt', git: 'https://github.com/demetrodon/lynda-translator-srt'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lynda-translator-srt

## Usage

```ruby
require 'lynda_translator_srt'
require 'fileutils'

FileUtils::mkdir_p Rails.root.join('public', 'srt_translated')
save_path = Rails.root.join('public', 'srt_translated')
zipname = LyndaTranslatorSrt::translate params_translate[:course_url], params_translate[:to_lang], save_path

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
