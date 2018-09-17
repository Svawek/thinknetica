fibonacci = [0, 1]
i = 1

while i < 100
    fibonacci << i
    i = fibonacci.last + fibonacci[-2]
end

puts fibonacci
