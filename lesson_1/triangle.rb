puts "Укажите высоту треугольника:"
triangle_height = gets.chomp.to_f

puts "Укажите длину основания треугольника:"
triangle_base = gets.chomp.to_f

puts "Площадь треугольника - #{triangle_height * triangle_base / 2}"