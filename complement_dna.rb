dna = File.read('rosalind_complement_dna.txt').chomp
complement = { 'A' => 'T', 'G' => 'C', 'T' => 'A', 'C' => 'G' }
dna_complement = dna.chars.inject('') do |dna_complement, nuc|
  dna_complement << complement[nuc]
end
puts dna_complement.reverse
