# A & X Rock
# B & Y Paper
# C & Z Scissors

VALUES = { "A" => 1, "B" => 2, "C" => 3, "X" => 1, "Y" => 2, "Z" => 3 }

RULES = {
  %w[A X] => [3, 3],
  %w[A Y] => [0, 6],
  %w[A Z] => [6, 0],
  %w[B X] => [6, 0],
  %w[B Y] => [3, 3],
  %w[B Z] => [0, 6],
  %w[C X] => [0, 6],
  %w[C Y] => [6, 0],
  %w[C Z] => [3, 3]
}

input_string = File.read("day2/input.txt")

their_score = 0
my_score = 0

input_string.each_line do |line|
  throws = line.strip.split(" ")

  their_throw = throws.first
  my_throw = throws.last

  their_throw_score = VALUES[their_throw]
  my_throw_score = VALUES[my_throw]

  their_score += their_throw_score
  my_score += my_throw_score

  ruling = RULES[throws]
  their_score += ruling.first
  my_score += ruling.last
end

p "My Score: #{my_score}"
p "Their Score: #{their_score}"
