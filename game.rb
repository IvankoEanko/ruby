choices = ["rock", "paper", "scissors"]

computer_choice = choices.sample

puts "Choose a move (rock, paper, or scissors):"
user_choice = gets.chomp.downcase

unless choices.include?(user_choice)
  puts "Please choose a valid move (rock, paper, or scissors)!"
  exit
end

puts "Your choice: #{user_choice}"
puts "Computer's choice: #{computer_choice}"

if user_choice == computer_choice
  puts "It's a tie!"
elsif (user_choice == "rock" && computer_choice == "scissors") ||
      (user_choice == "scissors" && computer_choice == "paper") ||
      (user_choice == "paper" && computer_choice == "rock")
  puts "You win!"
else
  puts "You lose!"
end