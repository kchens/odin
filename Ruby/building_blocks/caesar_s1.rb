def caesar(x,num)

	alphabet_lc = ('a'..'z').to_a
	transformed_string = ''

	for i in 0..x.length-1
		if alphabet_lc.include?(x[i].downcase)
			transformed_string += new_letter(x[i], num)
		else
			transformed_string += x[i]
		end
	end
	transformed_string
end

def new_letter(i, num)

	alphabet_lc = ('a'..'z').to_a
	alphabet_uc = ('A'..'Z').to_a

	if alphabet_lc.index i
		curr_ind = alphabet_lc.index i
	else
		curr_ind = alphabet_uc.index i
	end

	if num > 0 
		new_ind = curr_ind + num
		if new_ind > 26
			new_ind = new_ind -26
		end
	end

	if alphabet_lc.index 
		new_let = alphabet_lc[new_ind]
	else
		new_let = alphabet_uc[new_ind]
	end
end

#Instead of using Ruby's Integer ordinal for each character, 
#he created two arrays of alphabets with more simplified indexes (26)