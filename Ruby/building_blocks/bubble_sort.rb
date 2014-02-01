def bubble_sort(arr)
    temp = 0

	arr.each do |i|
		i = 0
		j = 1
		while (j < arr.length)
			if arr[i] > arr[j]
				temp = arr[i] 
				arr[i] = arr[j]
				arr[j] = temp 
                p arr
			end
			i+=1
			j+=1
		end
	end  
    arr
end

bubble_sort([4,3,78,2,0,2])



def bubble_sort(arr)
    temp = 0

	arr.each do |i|
		i = 0
		j = 1
		while (j < arr.length)
			if arr[i] > arr[j]
               arr[i], arr[j] = arr[j], arr[i]
			end
			i+=1
			j+=1
		end
        p arr
	end  
    arr
end




def bubble_sort(arr)
	temp = 0
    (arr.length).times do 
        i = 0
        j = 1
		while (j < arr.length)
			if arr[i] > arr[j] 
				temp = arr[i]
				arr[i] = arr[j] 
				arr[j] = temp 
			end
			i+=1
			j+=1
		end
        p arr
    end
    arr
end



def bubble_sort(arr)
    temp = 0
	counter = arr.length-1 

	counter.times do 
		i = 0
		j = 1
		while (j < arr.length)
			if arr[i] > arr[j]
				temp = arr[i] 
				arr[i] = arr[j]
				arr[j] = temp 
                counter-=1
                p arr
                p counter
			end
			i+=1
			j+=1
		end
	end  
    
    arr
end

bubble_sort([4,3,78,2,0,2])