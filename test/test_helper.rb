$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

require 'minitest/autorun'
require 'minitest/pride'

unless ENV['CI']
  require 'simplecov'

  SimpleCov.start do
    add_filter '/test/'
    add_group 'Utilities' do |file|
      !(file.filename =~ /_cases\.rb$/)
    end
    add_group 'Cases', '_cases.rb'
  end
end

# So we can be sure we have coverage on the whole lib directory:
Dir.glob('lib/*.rb').each { |file| require file.gsub(%r{(^lib\/|\.rb$)}, '') }
