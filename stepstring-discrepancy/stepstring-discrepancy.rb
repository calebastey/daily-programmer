##
# usage: ruby stepstring-discrepancy.rb input_file
#
# Status:  Working
#
# Optimizations over brute force:
#   * Uses Kadane's Algorithm to find the maximum subarray sum
#   * Modifies step size so calculations aren't repeated
#   * Only calculates the step string and discrepancy if the stepstring is > current max.
#
# Opimizations todo:
#   * Modify Kadane's algorithm to get max subarray in a single pass


#Kadane's Algorithm
def max_subarray(vals)
  max = 0
  max_here = 0
  vals.each do |v|
    max_here = max_here + v
    max_here = 0 if max_here < 0
    max = max_here if max < max_here
  end
  max
end

#Need to run Kadane's on both A and B.
def discrepancy(str)
  a_mapping = { 'a' => 1, 'b' => -1}
  b_mapping = { 'a' => -1, 'b' => 1}
  as = str.map{ |c| a_mapping[c] }
  bs = str.map{ |c| b_mapping[c] }
  [max_subarray(as), max_subarray(bs)].max
end

def get_stepstring(str, start, step_size)
  start.step(str.length, step_size).map{ |i| str[i] }.reject{ |a| a.nil? }
end

def max_discrepancy(str)
  max = 0
  (0...str.length).each do |i|
    max_step_size = str.length - i
    ((i + 1)..max_step_size).each do |j|
      # No need to calculate if the stepstring is smaller than current max
      if ((str.length - i) / j) + 1 > max
        d = discrepancy(get_stepstring(str, i, j))
        max = d if d > max
      end
    end
  end
  max
end

File.open(ARGV[0], 'r').each do |line|
  puts max_discrepancy(line.strip!)
end

