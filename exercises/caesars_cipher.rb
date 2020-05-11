def caesars_cipher(str, shift)
  new_str = str.chars.collect do |char|
    unless char.match?(/[A-Za-z]/)
      char
    else
      char_case = char.ord < 97 ? ('A'..'Z').to_a : ('a'..'z').to_a
      index = char_case.index(char) + shift
      # Divide by 26 if the shift takes us outside the length of the alphabet and take the remainder.
      index = index % 26 if index > 25 || index < -26
      char_case[index]
    end
  end
new_str.join
end

puts caesars_cipher("What a string!", 5)
puts caesars_cipher("Let's go negative?", -50)
puts caesars_cipher("MAssIve Number WitH Cr@zy Case!!?", 666)
puts caesars_cipher("ALL CAPS!", 20)