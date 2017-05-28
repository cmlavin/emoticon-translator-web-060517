require "yaml"

def load_library(file_path)
  emoticons = YAML.load_file('./lib/emoticons.yml')
  emoticon_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticon_hash.each do |key, value|
    emoticons.each do |meaning, array|
      if key == "get_meaning"
        value[array[1]] = meaning
      else
        value[array[0]] = array[1]
      end
    end
  end
  emoticon_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  if emoticons["get_emoticon"].include?(emoticon)
    emoticons["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  if emoticons["get_meaning"].include?(emoticon)
    emoticons["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
