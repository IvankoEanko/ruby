def roman_to_int(s)
  roman_dict = {
    'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50, 'C' => 100, 'D' => 500, 'M' => 1000
  }
  result = 0
  prev_value = 0
  s.reverse.each_char do |c|
    if roman_dict[c] < prev_value
      result -= roman_dict[c]
    else
      result += roman_dict[c]
    end
    prev_value = roman_dict[c]
  end
  result
end

def int_to_roman(n)
  roman_dict = {
    1 => 'I', 4 => 'IV', 5 => 'V', 9 => 'IX', 10 => 'X', 40 => 'XL',
    50 => 'L', 90 => 'XC', 100 => 'C', 400 => 'CD', 500 => 'D', 900 => 'CM', 1000 => 'M'
  }
  result = ''
  roman_dict.keys.sort { |a, b| b <=> a }.each do |value|
    while n >= value
      result += roman_dict[value]
      n -= value
    end
  end
  result
end

puts "Оберіть операцію:"
puts "1. Перетворити римське число в ціле число"
puts "2. Перетворити ціле число в римське число"
choice = gets.chomp.to_i

if choice == 1
  print "Введіть римське число: "
  roman_numeral = gets.chomp
  result = roman_to_int(roman_numeral)
  puts "Результат: #{result}"
elsif choice == 2
  print "Введіть ціле число (1 <= n < 4000): "
  number = gets.chomp.to_i
  if (1..3999).cover?(number)
    result = int_to_roman(number)
    puts "Результат: #{result}"
  else
    puts "Введене число не входить в діапазон 1 <= n < 4000"
  end
else
  puts "Неправильний вибір операції"
end
