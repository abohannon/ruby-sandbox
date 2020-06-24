### Without recursion

# rocks = 30.times.map{ rand(200) + 1 }
# puts rocks.join(', ')
# max_rock = 0

# rocks.each do |rock|
#     max_rock = rock if max_rock < rock
# end

# puts "Heaviest rock is: #{max_rock}"

### With recursion

# def rock_judger(rocks_arr)
#   if rocks_arr.length <= 2  # the base case
#     a = rocks_arr[0]
#     b = rocks_arr[-1]
#   else
#     a = rock_judger(rocks_arr.slice!(0, rocks_arr.length/2))
#     b = rock_judger(rocks_arr)
#   end

#   return a > b ? a : b
# end

# rocks = 30.times.map{ rand(200) + 1 }
# puts rocks.join(', ')
# puts "heaviest rock is: #{rock_judger(rocks)}"

# def append(ary, n)
#   return ary if n < 0
#   append(ary.push(n), n-1)
# end

# p append([], 2) # => [2,1,0]
# p append([], 3) # => [3,2,1,0]
# p append([], 20)

# Define a recursive function that finds the factorial of a number.

# def factorial(n)
#   if n == 0
#     1
#   else
#     n * factorial(n-1)
#   end
# end

# p factorial(5)

# Define a recursive function that returns true if a string is a palindrome and false otherwise.

# def palindrome?(str)
#   if str.length == 1 || str.length == 0
#     true
#   else
#     if str[0] == str[-1]
#       palindrome?(str[1..-2])
#     else
#       false
#     end
#   end
# end

# p palindrome?('racecar')
# p palindrome?('hello')

# Define a recursive function that takes an argument n and prints "n bottles of beer on the wall", "(n-1) bottles of beer on the wall", ..., "no more bottles of beer on the wall".

# def bottles_of_beer(n)
#   if n == 0
#     puts "no more bottles of beer on the wall"
#   else
#     puts "#{n} bottles of beer on the wall"
#     bottles_of_beer(n-1)
#   end
# end

# bottles_of_beer(10)

# Define a recursive function that takes an argument n and returns the fibonacci value of that position. The fibonacci sequence is 0, 1, 1, 2, 3, 5, 8, 13, 21... So fib(5) should return 5 and fib(6) should return 8.

# def fib(n)
#   return 0 if n == 0
#   return 1 if n == 1

#   fib(n-1) + fib(n-2)
# end

# p fib(100)

# Define a recursive function that flattens an array. The method should convert [[1, 2], [3, 4]] to [1, 2, 3, 4] and [[1, [8, 9]], [3, 4]] to [1, 8, 9, 3, 4].

# def flatten(arr, result = [])
#   arr.each do |element|
#     if element.instance_of?(Array)
#       flatten(element, result)
#     else
#       result << element
#     end
#   end
#   result
# end

# p flatten([[1, 2], [3, 4]])
# p flatten([[1, [8, 9]], [3, 4]])

# [1]

# Use the roman_mapping hash to define a recursive method that converts an integer to a Roman numeral.

# roman_mapping = {
#   1000 => "M",
#   900 => "CM",
#   500 => "D",
#   400 => "CD",
#   100 => "C",
#   90 => "XC",
#   50 => "L",
#   40 => "XL",
#   10 => "X",
#   9 => "IX",
#   5 => "V",
#   4 => "IV",
#   1 => "I"
# }

# def integer_to_roman(roman_mapping, number, result = "")
#   return result if number == 0
#   roman_mapping.keys.each do |divisor|
#     quotient, modulus = number.divmod(divisor)
#     result << roman_mapping[divisor] * quotient
#     return integer_to_roman(roman_mapping, modulus, result) if quotient > 0
#   end
# end

# p integer_to_roman(roman_mapping, 1234)

# Use the roman_mapping hash to define a recursive method that converts a Roman numeral to an integer.

# roman_mapping = {
#   "M" => 1000,
#   "CM" => 900,
#   "D" => 500,
#   "CD" => 400,
#   "C" => 100,
#   "XC" => 90,
#   "L" => 50,
#   "XL" => 40,
#   "X" => 10,
#   "IX" => 9,
#   "V" => 5,
#   "IV" => 4,
#   "I" => 1
# }

# def roman_to_integer(roman_mapping, str, result = 0)
#   return result if str.empty?
#   roman_mapping.keys.each do |roman|
#     if str.start_with?(roman)
#       result += roman_mapping[roman]
#       str = str.slice(roman.length, str.length)
#       return roman_to_integer(roman_mapping, str, result)
#     end
#   end
# end

# p roman_to_integer(roman_mapping, 'MCMDCD')



