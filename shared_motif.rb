dna_strings = File.readlines('rosalind_lcsm.txt').map { |str| str.strip }
fasta_map = {}
for str in dna_strings
  if str[0] == '>'
    dna_key = str.sub('>', '')
    fasta_map[dna_key] = ''
  else
    fasta_map[dna_key] << str
  end
end

def all_str_include(str_arr, substr)
  str_arr.each do |str|
    return false if !str.include?(substr)
  end
  true
end

def longest_substring(str1, str_arr)
  k = 0
  len = 1
  longest_substr = ''
  while k + len < str1.length
    cur_substr = str1[k, len]
    if all_str_include(str_arr, cur_substr)
      len += 1
      if cur_substr.length > longest_substr.length
        longest_substr = cur_substr
      end
    else
      k += 1
    end
  end
  longest_substr
end

p longest_substring(fasta_map.values[0], fasta_map.values[1..-1])
