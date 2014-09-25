dna_strings = File.readlines('rosalind_cons.txt').map(&:strip)
dna_map = []
i = -1
for str in dna_strings
  if str[0] == '>'
    i += 1
    dna_map[i] = ''
  else
    dna_map[i] << str
  end
end
dna_map.each do |dna|
  dna = dna.chars
end
count = {'A' => Array.new(dna_map[0].length) {0 },
         'C' => Array.new(dna_map[0].length) {0 },
         'G' => Array.new(dna_map[0].length) {0 },
         'T' => Array.new(dna_map[0].length) {0 }}
consensus = []
(dna_map[0].length).times do |j|
  max_alphabet_count = 0
  (dna_map.length).times do |i|
    cur_alphabet = dna_map[i][j]
    count[cur_alphabet][j] += 1
    cur_alphabet_count = count[cur_alphabet][j]
    if cur_alphabet_count > max_alphabet_count
      max_alphabet_count = cur_alphabet_count
      consensus[j] = cur_alphabet
    end
  end
end
puts consensus.join
count.each do |key, value|
  puts "#{key}: #{value.join(' ')}"
end
