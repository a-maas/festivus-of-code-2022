# A Rock
# B Paper
# C Scissors
# X Lose
# Y Draw
# Z Win

VALUES = { "A" => 1, "B" => 2, "C" => 3 }

RULES = {
  %w[A A] => [3, 3],
  %w[A B] => [0, 6],
  %w[A C] => [6, 0],
  %w[B A] => [6, 0],
  %w[B B] => [3, 3],
  %w[B C] => [0, 6],
  %w[C A] => [0, 6],
  %w[C B] => [6, 0],
  %w[C C] => [3, 3]
}

def strategy(their_throw, direction)
  return their_throw if direction == "Y"
  throws = VALUES.keys
  throws.reverse! if direction == "Z"
  throw_index = throws.index(their_throw)
  throws[throw_index - 1]
end

input_string = File.read("day2/input.txt")

their_score = 0
my_score = 0

input_string.each_line do |line|
  throws = line.strip.split(" ")

  their_throw = throws.first
  my_strategy = throws.last
  my_throw = strategy(their_throw, my_strategy)

  their_throw_score = VALUES[their_throw]
  my_throw_score = VALUES[my_throw]

  their_score += their_throw_score
  my_score += my_throw_score

  throws = [their_throw, my_throw]

  ruling = RULES[throws]
  their_score += ruling.first
  my_score += ruling.last
end

p "My Score: #{my_score}"
p "Their Score: #{their_score}"
