def hamming_distance(dna1, dna2)
  length = dna1.length
  p dna1, dna2
  hamming = 0
  (length -1).times do |i|
    hamming += 1 if dna1.chars[i] != dna2.chars[i]
  end
  hamming
end

dna_str = File.readlines('rosalind_hamm.txt').map(&:strip)

p hamming_distance(dna_str[0], dna_str[1])
