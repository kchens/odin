def substrings(string, bucket)
    words = string.split(/\[(s!?,.')\]/)
    p words 
    ret = {}
    i = 0

    words.each do |word|
        word.downcase!
	    while (i < bucket.size)
            if ret.has_key?(bucket[i])
                ret[bucket[i]] += 1
            else    
                c = ret[bucket[i]]
                c ||= 0 
            
                if word.include?(bucket[i])
                    c +=1
			        ret[bucket[i]] = c    
		        end
		        i+=1
	        end
        end
    end
	    ret
end


def substrings(string, dictionary)
    string.downcase!
    ret = {}

    dictionary.each do |w|
        times = string.scan(/#{w}/).count
        ret[w] = times if times > 0
    end
    ret
end

def substrings(word, dictionary)
    results = {}
    dictionary.each do |w|
        current = word.downcase
        w = w.downcase



dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("below", dictionary)

substrings("Howdy partner, sit down! How's it going?", dictionary)

#letters.each do |l|
#			elsif bucket.include?(l)
#				x = ret[l]
#				x +=1 
#				ret[l] = x
#			end 
#		end