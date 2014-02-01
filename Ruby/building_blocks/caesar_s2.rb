def caesar_cipher(input_string, shift_factor)
	positions = input_string.unpack('C*') #returns array, converts letters to Ruby's Integer ordinal. * does it for more than one letter.
	shifted_positions = positions.map do |pos|
		case pos
			when (65..90), (97..122) #comma is basically an ||
				shifted = pos + (shift_factor % 26) #by modulo-ing the shift_factor, don't need to worry about 26+ 
				if (shifted > 90 && shifted < 97) || (shifted > 122)
					shifted = shifted - 26
				end
				pos = shifted
			else
				pos
			end
		end
		result_string = shifted_positions.pack('C*') #converts numbers back to letters
		puts result_string
end
