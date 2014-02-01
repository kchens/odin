def stock_picker(stock_prices)

	buy_day = 0
	sell_day = 0
	max_profit = -1.0/0

	stock_prices.each_with_index do |buy_price, i|
		stock_prices[i+1..-1].each_with_index do |sell_price, j| #j always starts out as index 0 b/c of the buy_price loop
			if(sell_price - buy_price > max_profit)
				max_profit = sell_price - buy_price
				buy_day = i
				sell_day = j+i+1
			end
		end
	end

	return [buy_day, sell_day]

end

