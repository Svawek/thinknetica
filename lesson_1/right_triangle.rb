puts "Укажите длину первой стороны треугольника"
a = gets.chomp.to_f

puts "Укажите длину второй стороны треугольника"
b = gets.chomp.to_f

puts "Укажите длину третьей стороны треугольника"
c = gets.chomp.to_f

triangle = [a, b, c]
triangle.sort!

if triangle[2]**2 == triangle[0]**2 + triangle[1]**2 && triangle[0] == triangle[1]
  puts "Треугольник прямоугольный и равнобедренный"
elsif triangle[2]**2 == triangle[0]**2 + triangle[1]**2
  puts "Треугольник прямоугольный"
elsif  triangle[0] != triangle[2] && triangle[0] == triangle[1] || triangle[1] == triangle[2]
  puts "Треугольник равнобедренный, но не прямоугольный"
elsif a == b && b == c
  puts "Треугольник равнобедренный и равносторонний, но не прямоугольный"
else
  puts "Треугольник не прямоугольный"
end
