puts "Укажите длину первой стороны треугольника"
a = gets.chomp.to_f

puts "Укажите длину второй стороны треугольника"
b = gets.chomp.to_f

puts "Укажите длину третьей стороны треугольника"
c = gets.chomp.to_f

if a > b && a > c
  hypotenuse = a
  side_1 = b
  side_2 = c
elsif b > a && b > c
  hypotenuse = b
  side_1 = a
  side_2 = c
else
  hypotenuse = c
  side_1 = a
  side_2 = b
end

if hypotenuse**2 == side_1**2 + side_2**2 && side_1 == side_2
  puts "Треугольник прямоугольный и равнобедренный"
elsif hypotenuse**2 == side_1**2 + side_2**2
  puts "Треугольник прямоугольный"
elsif a == b && b == c
  puts "Треугольник равнобедренный и равносторонний, но не прямоугольный"
else
  puts "Треугольник не прямоугольный"
end
