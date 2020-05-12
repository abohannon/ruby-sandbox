def substrings(str, dictionary)
  found = Hash.new(0)

  str.downcase.split(' ').each do |word|
    dictionary.each do |substr|
      if word.include?(substr)
        found[substr.to_s] = found[substr.to_s] += 1
      end
    end
  end

  found
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
