def valid_ipv4?(str)
  parts = str.split(".")
  return false unless parts.length == 4
  parts.each do |part|
    return false unless part.match?(/^\d+$/) && part.to_i >= 0 && part.to_i <= 255
  end
  return true
end

puts "Введіть IP-адресу:"
input = gets.chomp

if valid_ipv4?(input)
  puts "Це коректна IPv4-адреса."
else
  puts "Це не коректна IPv4-адреса."
end
