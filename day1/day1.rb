input_string = File.read("day1/input.txt")
elves_total_calories = input_string.lines("\n\n").map { |elf| elf.lines.map { |c| c.strip.to_i }.sum  }
p elves_total_calories.max