def generate_password(length)
  characters = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
  password = ''

  length.times do
    password << characters.sample
  end

  password
end

puts "Введіть бажану довжину пароля:"
length = gets.chomp.to_i

if length <= 0
  puts "Невірна довжина пароля. Введіть додатнє ціле число."
else
  password = generate_password(length)
  puts "Згенерований пароль: #{password}"
end
