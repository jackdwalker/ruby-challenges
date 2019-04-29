# Write a class that implements the Caesar cipher.
# (http://practicalcryptography.com/ciphers/caesar-cipher/)
#
# When given a string, will return an uppercase string with each letter shifted
# forward in the alphabet by however many spots the cipher was initialized to.
#
# For example:
#
# c = CaesarCipher.new(5); # creates a CipherHelper with a shift of five
# c.decode('BFKKQJX') # returns 'WAFFLES'
# 
# If the shift pushes beyond the end of the alphabet, start back at 'A'
# Example: 
# c = CaesarCipher.new(1)
# c.encode('ZOO') # returns 'APP'
#
# If something in the string is not in the alphabet (e.g. punctuation, spaces), simply leave it as is.
#
# The shift will always be in range of [1, 26].

class CaesarCipher
  def initialize(shift)
    # your code here
    @shift = shift
    @cipher_shift_hash = {A: 1, B: 2, C: 3, D: 4, E: 5, F: 6, 
                           G: 7, H: 8, I: 9, J: 10, K: 11, L: 12, 
                           M: 13, N: 14,  O: 15, P: 16, Q: 17, R: 18, 
                           S: 19, T: 20, U: 21, V: 22, W: 23, X: 24, 
                           Y: 25, Z: 26}
    @string_arr = []
    @shift_arr = []                    
    @return_arr = []
  end

  # Was used in both methods. Made to keep code DRY. See initial comment inside of encode and/or decode method for more info.
  def array_init
    @shift_arr = []
    @return_arr = []
  end

  def encode(string)
    # your code here
    # Reinitializing these array to be empty in the event of multiple uses of the same object for encryption/decryption
    @string_arr = string.upcase.chars
    array_init

    value_at_key_into_array

    @shift_arr.each_with_index do |digit, index|
      # Adding the shift value to the shift arrays values to get new shifted character value
      @shift_arr[index] = digit + @shift

      # If value >26, it will not convert to alphabet. We know 27 should be A, so we subtract 26 to get A's value i.e. 1
      if @shift_arr[index] > 26
        @shift_arr[index] -= 26
      end
    end

   key_at_value_into_array

    return @return_arr.join("")
  end
  
  def decode(string)
    # your code here
    # Reinitializing these array to be empty in the event of multiple uses of the same object for encryption/decryption
    @string_arr = string.upcase.chars
    array_init

    value_at_key_into_array

    @shift_arr.each_with_index do |digit, index|
      # Adding the shift value to the shift arrays values to get new shifted character value
      @shift_arr[index] = digit - @shift

      # If value <= 0, it will not convert to alphabet. We know -1 should be Y, so we add 26 to get Y's value i.e. 25
      if @shift_arr[index] <= 0
        @shift_arr[index] += 26
      end
    end

    key_at_value_into_array

    return @return_arr.join("")
  end

  # Method for finding the key at a given index within string_arr and returning them to @shift_arr
  def value_at_key_into_array
    @string_arr.each_with_index do |char, index|
      # Converting each character to it's corresponding value pair in the cipher_shift_hash
      char_current_position = @cipher_shift_hash[@string_arr[index].to_sym]

      # Shovelling these values into an array. Effectively making an array of letters converted to corresponding number value
      @shift_arr << char_current_position
    end

    return @shift_arr
  end

  # Method for finding the value at a given index within string_arr and returning them to @return_arr
  def key_at_value_into_array
    @shift_arr.each_with_index do |_, index|
      # Converting each value in the shift_arr to its corresponding key within the cipher_shift_hash
      shifted_character = @cipher_shift_hash.key(@shift_arr[index])
      # Pushing this decoded character into the return array i.e. the decoded string array
      @return_arr << shifted_character
    end

    return @return_arr
  end

end
