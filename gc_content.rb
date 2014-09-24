def count(dna_str)
  alphabet = ['A', 'C', 'G', 'T']
  count = Array.new(4) { 0 }
  dna_str.chars.each do |char|
    count[alphabet.index(char)] += 1
  end
  count
end

def get_gc_content(dna)
  count = count(dna)
  (count[1] + count[2]) * 100 / count.inject(:+).to_f
end

dna_strings = File.readlines('rosalind_gc.txt').map { |str| str.strip }
max = {:gc => 0, :dna_key => ''}
dna_map = {}
for str in dna_strings
  if str[0] == '>'
    dna_key = str
    dna_map[dna_key] = ''
  else
    dna_map[dna_key] << str
  end
end
p dna_map
dna_map.each do |key, dna_str|
    cur_gc = get_gc_content(dna_str)
    if max[:gc] < cur_gc
      max[:gc] = cur_gc
      max[:dna_key] = key
    end
end
p max
puts max[:dna_key].sub('>', '')
puts max[:gc]
