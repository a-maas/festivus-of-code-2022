input_string = File.read("day3/input.txt")

lower_priority =
  ("a".."z").each_with_object({}).with_index { |(l, hsh), i| hsh[l] = i + 1 }

upper_priority =
  ("A".."Z").each_with_object({}).with_index { |(l, hsh), i| hsh[l] = i + 27 }

priorities = lower_priority.merge(upper_priority)

rucksacks = input_string.lines.map { |rucksack| rucksack.strip! }

rsum =
  rucksacks
    .each_slice(3)
    .sum do |rucksack_group|
      ruck1 = rucksack_group[0].chars
      ruck2 = rucksack_group[1].chars
      ruck3 = rucksack_group[2].chars
      badges = (ruck1 & ruck2 & ruck3).first
      priorities[badges]
    end

p rsum
