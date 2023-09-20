def infix_to_rpn(expression)
  precedence = {'+' => 1, '-' => 1, '*' => 2, '/' => 2}
  output = []
  stack = []

  expression.split.each do |token|
    if token.match?(/\d+/)
      output << token
    elsif token == '('
      stack.push(token)
    elsif token == ')'
      while stack.last != '('
        output << stack.pop
      end
      stack.pop
    else
      while !stack.empty? && precedence[token] <= precedence[stack.last]
        output << stack.pop
      end
      stack.push(token)
    end
  end

  while !stack.empty?
    output << stack.pop
  end

  output.join(' ')
end

print "Введіть математичний вираз: "
input = gets.chomp
rpn_output = infix_to_rpn(input)
puts "RPN: #{rpn_output}"
