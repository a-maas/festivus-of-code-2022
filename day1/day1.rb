input_string = File.read("day1/input.txt")
elves_total_calories = input_string.lines("\n\n").map { |elf| elf.lines.map { |c| c.strip.to_i }.sum  }.sort
p "Most Calories Elf: #{elves_total_calories.max}"
p "Top 3 Elf Calories #{elves_total_calories.last(3).sum}"