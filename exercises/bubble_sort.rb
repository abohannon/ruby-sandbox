def bubble_sort(arr)
  counter = nil

  while counter != :sorted
    counter = :sorted
    for i in (0...arr.length-1)
      if arr[i] > arr[i+1]
        temp = arr[i]
        arr[i] = arr[i+1]
        arr[i+1] = temp
        counter = :unsorted
      end
    end
  end
  arr
end

p bubble_sort([4,3,78,2,0,2])
p bubble_sort([1,1,1,-1,0,-10,3])