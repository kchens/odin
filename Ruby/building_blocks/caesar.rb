#caesar_cipher breaks the string into words -- 
#then feeds the words into the shift method"
def caesar_cipher(string, s_num)
	i = 1
	n_words = []

	words = string.split(" ")

	words.each do |w|
		n_words.push(shift(w, s_num))
	end
	
	n_words.join(" ")
end   

def shift(word, s_num)
    r_lowercase = ('a'..'z').to_a

	letters = word.split("")
	n_let = []

	letters.each do |l|
        
		if r_lowercase.include?(l.downcase)        

			ol = l[0].ord #87 w, 97 a
			nl = ol + s_num #equals 5
			#92 w, 102 a
		
			if (nl > 90 && nl <=97) #90 = Z
				diff = 90 - ol #3
				r_diff = s_num - (diff + 1)
				n_pos = 65 + r_diff
				n_let.push(n_pos.chr)
			elsif (nl > 122) #122 = z
				diff = 122 - ol
				r_diff = s_num - (diff + 1)
				n_pos = 97 + r_diff
				n_let.push(n_pos.chr)
			elsif ((nl >= 65 && nl <= 90) || (nl >= 97 && nl<=122))
				n_let.push(nl.chr)
			end
		else
    		n_let.push(l)
		end
	end

	n_word = n_let.join("")
end

caesar_cipher("What a string!", 5)


1. split the string into chars
2. if char is a letter, convert letter to number (uppercase/lowercase)
	3. shift the letter 
	4. convert back to a number
	5. put it back to array
6. if char not letter, add back to array
7. 

#"a".ord = 97
#b = 98
#z = 122
#
#A = 65
#B = 66
#Z = 90

#120.chr = a