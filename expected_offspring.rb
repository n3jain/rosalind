given_parents = [ 'AA-AA', 'AA-Aa', 'AA-aa', 'Aa-Aa', 'Aa-aa', 'aa-aa' ]
p_A = Array.new(given_parents.length, 0.0)

given_parents.each_with_index do |parents, index|
  parents = parents.split('-')
  offsprings = parents[0].chars.product(parents[1].chars)
  n_A = offsprings.select {|offspring| offspring.include?('A') }.length
  p_A[index] = n_A/offsprings.length.to_f
end

p p_A

sample = File.read('rosalind_iev.txt').strip.split(' ')
expected_number = 0
sample.each_with_index do |k, index|
  expected_number += k.to_i * p_A[index] * 2
end
p expected_number
