purcase = {}

loop do
  puts "Введите название товара:"
  product = gets.chomp
  break if product.downcase == "стоп"
  puts "Введите цену за единицу товара:"
  price = gets.chomp.to_f
  puts "Введите количество товара:"
  amount = gets.chomp.to_f
  purcase[product] = {price => amount}
end
money_sum = 0
purcase.each do |product, price_amount|
  price_amount.each do |price, amount|
    money_sum_position = (price * amount).round(2)
    money_sum += money_sum_position
    puts "Вы купили #{product} в количестве #{amount} по цене #{price}. Сумма по данной позиции #{money_sum_position}."
  end
end
puts "Сумма всех покупок: #{money_sum.round(2)}"


