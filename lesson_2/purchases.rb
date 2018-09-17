purcase = {}

loop do
  puts "Введите название товара:"
  product = gets.chomp
  break if product.downcase == "стоп"
  puts "Введите цену за единицу товара:"
  price = gets.chomp.to_f
  puts "Введите количество товара:"
  amount = gets.chomp.to_f
  purcase[product] = {price: price, amount: amount}
end
money_sum = 0
purcase.each do |product, price_amount|
  money_sum_position = (price_amount[:price] * price_amount[:amount]).round(2)
  money_sum += money_sum_position
  puts "Вы купили #{product} в количестве #{price_amount[:amount]} по цене #{price_amount[:price]}. Сумма по данной позиции #{money_sum_position}."
end
puts "Сумма всех покупок: #{money_sum.round(2)}"
