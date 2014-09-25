# n no. of months
# rabbits live for m months
# reproduce after 1 month - 1 pair
dataset = File.read('rosalind_fibd.txt')
n, m = dataset.split(' ').collect { |e| e.to_i }

def remove_dead_rabbits(generations, m)
  dead_rabbits = generations[m] if m >= 0
  if dead_rabbits && dead_rabbits > 0
    generations.size.times do |j|
      if generations[j] > 0
        generations[j] -= dead_rabbits
      end
    end
  end
  generations
end

def rabbits(n, m)
  p "#{n}, #{m}"
  generations = [1, 1]
  (2...n).each do |i|
    generations[i] = generations[i-2] + generations[i-1]
    generations = remove_dead_rabbits(generations, i-m)
  end
  generations[n-1]
end

puts rabbits(n, m)
