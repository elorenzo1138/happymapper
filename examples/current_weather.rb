dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'happymapper')

file_contents = File.read(dir + '/../spec/fixtures/current_weather.xml')

class CurrentWeather
  include HappyMapper
  tag 'aws:ob'
  element :temperature, Integer, :tag => 'aws:temp'
  element :feels_like, Integer, :tag => 'aws:feels-like'
  element :current_condition, String, :tag => 'aws:current-condition', :attributes => {:icon => String}
end

CurrentWeather.parse(file_contents).each do |current_weather|
  puts "temperature: #{current_weather.temperature}"
  puts "feels_like: #{current_weather.feels_like}"
  puts "current_condition: #{current_weather.current_condition}"
  puts "current_condition.icon: #{current_weather.current_condition.icon}"
end