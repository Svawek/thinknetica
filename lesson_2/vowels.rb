range_letters = ('a'..'z')
vowels = ["a", "e", "i", "o", "u", "y"]
letter_position = {}
vowels_position = {}
i = 1

range_letters.each_with_index do |letter, index|
    letter_position[letter] = index + 1
end
puts letter_position

vowels.each do |letter|
    vowels_position[letter] = letter_position[letter]
end
puts vowels_position
