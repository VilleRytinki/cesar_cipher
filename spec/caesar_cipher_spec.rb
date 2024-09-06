require 'spec_helper'
require_relative '../caesar_cipher'

RSpec.describe 'Cesar Cipher' do
  describe 'Ciphering strings' do
    it 'returns 2d array of words and characters' do
      string = "Very magnificent string!"
      expected = [["V", "e", "r", "y"], ["m", "a", "g", "n", "i", "f", "i", "c", "e", "n", "t"], 
        ["s", "t", "r", "i", "n", "g", "!"]]

      expect(get_2d_array_of_words_split_to_characters(string)).to eq(expected)
    end

    it 'shifts characters' do
      characters = [["A", "b", "c", "d"], ["e", "f", "!"]]
      expected = [["F", "g", "h", "i"], ["j", "k", "!"]]

      expect(shift_characters_by(characters, 5)).to eq(expected)
    end

    it 'ciphers a word' do
      word = ["W", "h", "a", "t"]
      expected = ["B", "m", "f", "y"]

      expect(cipher_word(word, 5)).to eq (expected)
    end
    it 'replaces a character' do
      character = 'z'
      expected = 'c'

      expect(replace_character(character, 3)).to eq(expected)
    end

    it 'does not change the casing of character' do
      character = 'A'
      expected = 'D'

      expect(replace_character(character, 3)).to eq(expected)
    end

    it 'does not replace non-literal character' do
      character = '!'
      expected = '!'

      expect(replace_character(character, 3)).to eq(expected)
    end
    
    it 'constructs a string from shifted chars' do
      characters = [["V", "e", "r", "y"], ["n", "o", "!"]]
      expected = "Very no!"

      expect(construct_a_string_from(characters)).to eq(expected)
    end

    it 'returns the ciphered string with the same case' do
      ciphered = caesar_cipher("What a string!", 5)
      expected = "Bmfy f xywnsl!"
      expect(ciphered).to eq(expected)
    end
  end
end