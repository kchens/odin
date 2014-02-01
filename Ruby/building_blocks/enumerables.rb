module Enumerable
  def my_each
    if self.instance_of?(Array)
      i = 0
      while i < self.size
        yield(self[i])
        i += 1
        end
    self
    elsif self.instance_of?(Hash)
      i = 0
      arr = self.to_a
      while i < arr.size
        yield([arr[i][0], arr[i][1]])
        i += 1
      end
      self
    end
  end

  def my_each_with_index
    i = 0
    temp = self.to_a
    while i < temp.size
      yield(temp[i], i)
      i +=1
    end
    temp
  end

  def my_select #still can't get hash to work    	
    if self.instance_of?(Array)
      ret = []
      self.my_each do |item|
        ret << item if yield(item)
      end
      ret
    elsif self.instance_of?(Hash)
      ret = {}
      self.my_each do |key, value|
        ret[key] = value if yield(key, value)
      end
      ret
    end
  end

  def my_all?
    everything = true
    self.my_each do |item|
      everything = false if (yield(item) == false || yield(item) == nil)
    end
    everything
  end

  def my_any?
    everything = false
    self.my_each do |item|
      everything = true if yield(item)
    end
    everything
  end

  def my_none?(&block)
    !(self.my_any? &block)
  end

  def my_count(&block)
    c = 0
    self.my_each do |item| 
      c+=1 if block.call(item)
    end
    c
  end

  def my_map(&block) #to take Procs, delete '&'
    ret = []
    self.my_each do |item|
      ret << block.call(item)
    end
    ret
  end

  def my_inject(accumulator = Object.new)
    self.each do |item|
      if accumulator.class == Object
        accumulator = elem
      else 
        accumulator = yield(accumulator, item)
      end
    end
    accumulator 
  end


end

[1,2,3].my_each_with_index do |item, index|
    puts "#{item} is at #{index}"
end

arr = [1,2,3]
arr.my_select do |item|
    item > 2
end

[nil, true, 99]
h = { "a" => 100, "b" => 200, "c" => 300 }
h.my_each {|k,v| puts "#{k} and #{v}"}
#h.my_select {|k,v| k > "a"}
#h.my_select {|k,v| v < 200}