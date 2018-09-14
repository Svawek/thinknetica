range = (10..100)
numbers = []

range.each do |n|
    numbers << n if n % 5 == 0
end

puts numbers