dataset = File.readlines('rosalind_subs.txt').map(&:strip)

dna = dataset[0]
motif = dataset[1]

p dna, motif

position = []
(0..dna.length-motif.length-1).each do |i|
  position << i + 1 if dna[i...i+motif.length] == motif
end

puts position.join(' ')
