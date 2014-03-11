def convert(hash, num)
  ret ||= []
  return ret if num == 0
    if hash.has_key?(num)
      ret.unshift(hash[num])
    else
      ret.unshift(hash[num])
      convert(hash, num-1)
    end
end

def integer(roman_mapping, number, result = '')
  return result if number == 0
  roman_mapping.keys.each do |divisor|
  	quotient, modules = number.divmod(divisor)
  	result << roman_mapping[divisor] * quotient
  	return integer(roman_mapping, modulus, result)
    if quotient > 0
  end
end

def fibs(n)
  ret = []
  (0..n).each do |i|
  	if i < 2
  	  ret << i
  	elsif
  	  ret << (ret[i-1]+ret[i-2])
  	end
  end
  ret
end

def fibs_rec(n)
  return n if n == 0 || n == 1 
  (fibs_rec(n-1) + fibs_rec(n-2)) if n > 1
end