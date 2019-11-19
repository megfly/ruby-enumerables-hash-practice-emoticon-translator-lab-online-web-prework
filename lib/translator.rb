require 'yaml'

def load_library(file_path)
  library = YAML.load_file(file_path)
  result = {"get_meaning" => {}, "get_emoticon" => {}} 
  library.each do |meaning, emoticons|
    result ["get_meaning"][emoticons[1]] = meaning 
    result["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  result
end



def get_japanese_emoticon (file_path, emoticon)
  hash = load_library(file_path)
  hash["get_emoticon"].each do |eng,jap|
    return jap if eng == emoticon
    if eng == emoticon
      return jap 
      break 
    end 
  end
  "Sorry, that emoticon was not found"
end



def get_english_meaning (file_path, emoticon)
  hash = load_library(file_path)
  hash["get_meaning"].each do |jap_emot, meaning|
    return meaning if jap_emot == emoticon 
    if jap_emot == emoticon
      return meaning 
      break 
    end
  end
  "Sorry, that emoticon was not found"
end