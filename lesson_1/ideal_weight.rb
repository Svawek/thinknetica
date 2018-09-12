puts "Как Вас зовут?"
name = gets.chomp

puts "Какой Ваш рост?"
height = gets.chomp.to_i

if height > 110
    puts "Ваш идеальный вес #{height - 110}."
else
    puts "Ваш вес уже оптимальный."
end