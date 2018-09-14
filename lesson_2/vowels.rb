range_letters = ('a'..'z')
vowels = ["a", "e", "i", "o", "u", "y"]
letter_position = {}
vowels_position = {}
i = 1

range_letters.each do |letter|
    letter_position[letter] = i
    i += 1
end
puts letter_position