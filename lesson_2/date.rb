year_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
puts "Введите число:"
current_date = gets.chomp.to_i

puts "Введите месяц:"
current_month = gets.chomp.to_i

puts "Введите год:"
current_year = gets.chomp.to_i

leap_year = current_year % 4 == 0 && current_year % 100 == 0 ? current_year % 400 == 0 : current_year % 4 == 0

if leap_year then year_days[1] = 29 end

days_numbder = year_days.take(current_month - 1).sum + current_date
puts "Это #{days_numbder} день года"
