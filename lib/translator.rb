# require modules here

require "yaml"

def load_library(name)
new_hash = {}
#load the emoticon yaml file as a ruby-readable hash
emoticons = YAML.load_file(name)

#iterate through the hash. k will be our keys which are string representing rhe mood.
# the value is an array.

emoticons.each do |k, v|

#if the key (mood) doesnt exist in the new hash, add it and
if new_hash[k] == nil
  #set it equal to a nested hash of two keys representing the language of the emoticon
  # set that equal to empty string for now
  new_hash[k] = {:english => "", :japanese => ""}
end
#if new_hash[mood][value (langauge)] doesnt exist, add it in.
#using variable at position 0 or 1. because we know that the element at 0 index is always english
# and element at 1 index is japanese
if new_hash[k][v] == nil
  new_hash[k][:english] = v[0]
  new_hash[k][:japanese] = v[1]
end

end
new_hash
end


def get_japanese_emoticon(library, emoticon)
  # set up empty string to store my answer result
ans = ''
#load the library and iterate though the category and keys (which is a hash)
load_library(library).each do |category, hash_of_values|
  # iterate through the hash_of_values hash to break it up by language and emotion
hash_of_values.each do |lang, emoji|
  # if the emotion in the hash is equal to the parameter passed to us,
  # set our 'ans' variable to the japanese result and return it
  if emoji == emoticon
    ans = "#{load_library(library)[category][:japanese]}"
    return ans
    # if not, set our 'ans variable to a not found message'
  elsif emoji != emoticon
    ans = "Sorry, that emoticon was not found"
  end
  end
  end
  #outside of the loop, return the variable
  return ans
end


def get_english_meaning(library, emoticon)
  ans = ''
  load_library(library).each do |category, hash_of_values|
  hash_of_values.each do |lang, emoji|
  if emoji == emoticon
    ans = "#{category}"
    return ans
  elsif emoji != emoticon
    ans = "Sorry, that emoticon was not found"
  end
  end
  end
  return ans
end
