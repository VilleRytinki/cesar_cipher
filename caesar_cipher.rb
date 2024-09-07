def caesar_cipher(string, shift_factor)
  characters = get_2d_array_of_words_split_to_characters(string)

  shifted_chars = shift_characters_by(characters, shift_factor)

  ciphered_string = construct_a_string_from(shifted_chars)

  return ciphered_string
end

def get_2d_array_of_words_split_to_characters(string)
  characters = []
  words = string.split
  
  words.each do |word|
    characters << word.chars
  end

  return characters
end


def shift_characters_by(words, shift_factor)
  shifted_chars = []
  words.each do |word|
    shifted_chars << cipher_word(word, shift_factor)
  end
  return shifted_chars
end

def construct_a_string_from(shifted_chars)
    string = ""
    shifted_chars.each do |word|
      word.each do |char|
        last_character_of_word = char == word.last
        last_word_on_list = word == shifted_chars.last
        unless last_character_of_word
          string << char
        else
          last_word_on_list ? string << char : string << char + " "
        end
      end
    end

    return string
end

def cipher_word(word, shift_factor)
  ciphered_word = []
  
  word.each do |character|
    ciphered_word.append(replace_character(character, shift_factor))
  end

  return ciphered_word
end

def replace_character(character, shift_factor)
    alphabet = ("a".."z").to_a
    upcase_character = upcase?(character)

    character.downcase! if upcase_character

    unless alphabet.any?(character)
       return character
    else
      index_of_character = alphabet.index(character)
      new_index = index_of_character + shift_factor
      alphabet_wraps = new_index > alphabet.length
      if alphabet_wraps
        new_index -= alphabet.length
      end
    end

    new_character = alphabet[new_index]



    return upcase_character ? new_character.upcase : new_character
end

def upcase?(character)
  character == character.upcase
end

