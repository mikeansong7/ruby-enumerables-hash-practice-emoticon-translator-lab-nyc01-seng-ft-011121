require 'yaml'


def load_library(file_path)
  file_path = 'lib/emoticons.yml'
  emoticons = {"get_emoticon" => {}, "get_meaning" => {} }
  library = YAML.load_file(file_path)
  library.each do |meaning, symbol|
    emoticons["get_emoticon"][symbol.first] = symbol.last
    emoticons["get_meaning"][symbol.last] = meaning
  end 
  emoticons
end

def get_japanese_emoticon(yaml_file, emoticon)
  library = load_library(yaml_file)
  response = nil
  library["get_emoticon"].each do |english, japanese|
    if emoticon == english
      response = japanese
    end
  end
  if response == nil
    return "Sorry, that emoticon was not found"
  else
    return response
  end
end


def get_english_meaning(yaml_file, emoticon)
  library = load_library(yaml_file)
  response = nil
  library["get_meaning"].each do |emo, trans|
    if emo == emoticon
      response = trans
    end
  end
  if response == nil
    return "Sorry, that emoticon was not found"
  else
    return response
  end