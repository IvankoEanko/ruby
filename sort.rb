def sort_numbers(numbers, order)
  if order == "+"
    numbers.sort!
  elsif order == "-"
    numbers.sort! { |a, b| b <=> a }
  else
    puts "Невірний вибір. Введіть 'asc' для сортування за зростанням або 'desc' для сортування за спаданням."
    return
  end

  puts "Відсортований список: #{numbers.join(', ')}"
end

puts "Введіть список чисел через кому (наприклад, 5, 3, 1, 4):"
input = gets.chomp
numbers = input.split(',').map(&:to_i)

puts "Виберіть порядок сортування ('+' для зростання, '-' для спадання):"
order = gets.chomp.downcase

sort_numbers(numbers, order)
