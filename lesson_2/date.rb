leap_year = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
not_leap_year = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
puts "Введите число:"
current_date = gets.chomp.to_i

puts "Введите месяц:"
current_month = gets.chomp.to_i

puts "Введите год:"
current_year = gets.chomp.to_i

days = current_date

if current_year % 4 == 0
  if current_year % 100 !=0 || (current_year % 100 == 0 && current_year % 400 ==0)
    month_calc = leap_year.take(current_month - 1)
    month_calc.each do |days_in_month|
      days += days_in_month
    end
    puts "Это #{days} день года"
  else
    month_calc = not_leap_year.take(current_month - 1)
    month_calc.each do |days_in_month|
      days += days_in_month
    end
    puts "Это #{days} день года"
  end
else
  month_calc = not_leap_year.take(current_month - 1)
  month_calc.each do |days_in_month|
    days += days_in_month
  end
  puts "Это #{days} день года"
end

