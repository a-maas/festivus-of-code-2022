require "csv"

def create_range(string)
  range = string.split("-").map(&:to_i)
  (range.first..range.last)
end

assignments = CSV.read("day4/input.csv")

p(
  assignments.count do |pair|
    range1 = create_range(pair.first)
    range2 = create_range(pair.last)
    range1.cover?(range2) || range2.cover?(range1)
  end
)
