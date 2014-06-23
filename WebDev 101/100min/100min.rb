class PersonalChef

  def make_toast(color)
 	if color.nil?
 		p "How am I supposed to make nothingness toast?"
 	else
    puts "Making your toast #{color}"
    end
    return self
  end

  def make_eggs(quantity)
    puts "Making you #{quantity} eggs!"
    return self
  end

	def make_milkshake(flavor)
    puts "Making you #{flavor} milkshake!"
    return self
  end

  def gameplan(meals)
  meals.each do |meal|
    puts "We'll have #{meal}..."
  end

  all_meals = meals.join(", ")
  puts "In summary: #{all_meals}"
	end

def inventory
  produce = {apples: 3, oranges: 1, carrots: 12}
  produce.each do |item, quantity|
    puts "There are #{quantity} #{item} in the fridge."
  end
end

end

class Butler
	def open_door(name)
		p "opened #{name} door"
	end
end	