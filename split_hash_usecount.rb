def word_count(sentence)
  words = sentence.downcase.split(/\W+/)
  word_count_hash = Hash.new(0)

  words.each do |word|
    word_count_hash[word] += 1
  end

  word_count_hash
end


sentence = "You spin my head right round, right round
When you go down, when you go down down
You spin my head right round, right round
When you go down, when you go down down You spin my head right round, right round
When you go down, when you go down down
You spin my head right round, right round
When you go down, when you go down down"
result = word_count(sentence)
puts result
