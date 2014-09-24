def count(dna_str)
  alphabet = ['A', 'C', 'G', 'T']
  count = Array.new(4) { 0 }
  dna_str.chars.each do |char|
    count[alphabet.index(char)] += 1
  end
  count
end

dna_str = File.read('dataset.txt').chomp
puts count(dna_str).join(' ')
