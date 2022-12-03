input_string = File.read("day3/input.txt")

lower_priority =
  ("a".."z").each_with_object({}).with_index { |(l, hsh), i| hsh[l] = i + 1 }

upper_priority =
  ("A".."Z").each_with_object({}).with_index { |(l, hsh), i| hsh[l] = i + 27 }

priorities = lower_priority.merge(upper_priority)

rucksacks =
  input_string.lines.map do |rucksack|
    rucksack.strip!
    length = rucksack.length
    half = (length / 2)
    [rucksack[0..half - 1], rucksack[half..length - 1]]
  end

priority_sum =
  rucksacks.sum do |rucksack|
    compartment1 = rucksack.first.chars
    compartment2 = rucksack.last.chars
    shared_item = (compartment1 & compartment2).first
    priorities[shared_item]
  end

p priority_sum
