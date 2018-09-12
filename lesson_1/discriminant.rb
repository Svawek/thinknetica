puts "Введите клэфициент a"
a = gets.chomp.to_f

puts "Введите клэфициент b"
b = gets.chomp.to_f

puts "Введите клэфициент c"
c = gets.chomp.to_f

discriminant = b**2 - (4 * a * c)

if discriminant > 0
    x_1 = (-b + Math.sqrt(discriminant)) / (2 * a)
    x_2 = (-b - Math.sqrt(discriminant)) / (2 * a)
    puts "Дискриминант = #{discriminant}, x1 = #{x_1}, x2 = #{x_2}"
elsif discriminant == 0
    x = (-b) / (2 * a)
    puts "Дискриминант = #{discriminant}, x1, x2 = #{x}"
else
    puts "Корней нет"
end
