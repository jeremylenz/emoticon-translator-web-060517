# require modules here
require 'pry'
require 'yaml'


def load_library(file_path)
library = YAML.load_file(file_path)
formatted_library = {"get_meaning" => {}, "get_emoticon" => {}}

# populate get_meaning
library.each do |meaning, eng_jpn_emoticons|
  formatted_library["get_meaning"][eng_jpn_emoticons[1]] = meaning
end

#populate get_emoticon
library.each do |meaning, eng_jpn_emoticons|
  formatted_library["get_emoticon"][eng_jpn_emoticons[0]] = eng_jpn_emoticons[1]
end



formatted_library
end

def get_japanese_emoticon(file_path, emoticon)

library = load_library(file_path)
japanese_emoticon = library["get_emoticon"][emoticon]
japanese_emoticon == nil ? "Sorry, that emoticon was not found" : japanese_emoticon



end

def get_english_meaning(file_path, emoticon)

  library = load_library(file_path)
  english_meaning = library["get_meaning"][emoticon]
  english_meaning == nil ? "Sorry, that emoticon was not found" : english_meaning


end
