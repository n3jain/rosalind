dna_strings = File.readlines('rosalind_grph.txt').map { |str| str.strip }
fasta_map = {}
for str in dna_strings
  if str[0] == '>'
    dna_key = str.sub('>', '')
    fasta_map[dna_key] = ''
  else
    fasta_map[dna_key] << str
  end
end

def overlap_graph(fasta_map, k)
  graph = {}
  fasta_map.each do |key, val|
    fasta_map.each do |mkey, mval|
      if key != mkey &&
        val != mval &&
        val[-k..-1] == mval[0..k-1]
        if graph[key]
          graph[key] << mkey
        else
          graph[key] = [mkey]
        end
      end
    end
  end
  graph
end

graph = overlap_graph(fasta_map, 3)
graph.each do |key, value|
  value.each do |val|
    puts "#{key} #{val}"
  end
end
