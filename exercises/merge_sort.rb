def merge_sort(arr)
  return arr if arr.length == 1

  mid = (arr.length / 2).floor
  # this recursion will run until we reach a single element
  left = merge_sort(arr[0..mid - 1])
  right = merge_sort(arr[mid..-1])
  # once the recursion is finished, the single element arrays are sent to merge
  merge(left, right)
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  elsif left.first > right.first
    [right.first] + merge(left, right[1..right.length])
  end
end

p merge_sort([5,8,1,2,7,4,6,3])
