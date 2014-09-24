# n no. of months
# rabbits live for m months
# reproduce after 1 month - 1 pair
def rabbits(n, m)
  generations = [1, 1]
  (n-1).times do |i|
    dead_rabbits = if i-m-1 < 0
                     0
                   else
                     generations[i-m-1]
                   end
    generations[i+2] = generations[i+1] + generations[i] - dead_rabbits
  end
  generations[n-1]
end
# Problem: Mortal Fibonacci Rabbits
dataset = File.read('rosalind_fibd.txt')
# Fn = Fn-2 * k + Fn - 1 - (Fn-3)
n, m = dataset.split(' ').collect { |e| e.to_i }

generations = []
n.times do |i|
  if i < 2
    generations[i] = [[1, 1]]
  else
    breeding_pairs = generations[i - 2]
    new_pairs = breeding_pairs.inject(0) { |sum, e| e[0] + sum }
    generations[i] = generations[i - 1].reject { |e| e[1] <= i - (m - 1) }.push([new_pairs, i])
  end
  p i, generations
end
puts generations.last.inject(0) { |sum, e| e[0] + sum}

puts rabbits(n, m)
#p rabbits(95, 16)
#p rabbits(6, 3)
