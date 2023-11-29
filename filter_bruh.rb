class Filter
  attr_accessor :numbers

  def initialize
    @numbers = []
  end

  def filter(&block)
    instance_eval(&block)
  end

  def greater_than(value)
    @numbers = @numbers.select { |num| num > value }
  end

  def less_than(value)
    @numbers = @numbers.select { |num| num < value }
  end
end

filter = Filter.new

puts "Введіть числа (розділені пробілами):"
input = gets.chomp
numbers_array = input.split.map(&:to_i)

filter.filter do
  @numbers = numbers_array

  puts "Введіть мінімальне значення:"
  min_value = gets.chomp.to_i
  greater_than(min_value)

  puts "Введіть максимальне значення:"
  max_value = gets.chomp.to_i
  less_than(max_value)
end

puts "Результат фільтрації: #{filter.numbers}"

