#!/usr/bin/ruby

def stock_picker(days)
    f_day = 0
	l_day = days.length - 1

	max = 0
	b_idx = 0
	e_idx = 0

	arr = []
	while (f_day < l_day)
		for i in f_day..l_day
			profit = days[l_day]-days[i]

			if (profit >= 0)
				if profit > max
                    max = profit  
				    b_idx = i
				    e_idx = l_day 	
                end
			end
		end
		l_day-=1

	end

	arr.push(b_idx, e_idx, max)
	
end

stock_picker([17,3,6,9,15,8,6,1,10])