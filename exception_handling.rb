values = [42, 'a', 'r', 9, 5, 10022, 8.7, "sharon", "Libya", "Mars", "12", 98, rand + rand, {:dog=>'cat'}, 100, nil, 200.0000, Object, 680, 3.14, "Steve", 78, "Argo"].shuffle

while values.length > 0
  a = values.pop
  b = values.pop

  begin
    a + b
  rescue => exception
    puts "Could not add variables a (#{a.class}) and b (#{b.class}) because #{exception}"
  else
    puts "a + b is #{a + b}"
  end
end

puts "============"
puts "Using retry"
puts "============"

for i in 'A' .. 'C'
  retries = 2
  begin
    puts "Executing command #{i}"
    raise "Exception: #{i}"
  rescue Exception => e
    puts "\tCaught: #{e}"
    if retries > 0
      puts "\tTrying #{retries} more times\n"
      retries -= 1
      sleep 2
      retry
    end
  end
end
