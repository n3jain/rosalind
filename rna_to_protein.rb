rna_codon_map = {
  'UUU' => 'F',      'CUU' => 'L',      'AUU' => 'I',      'GUU' => 'V',
  'UUC' => 'F',      'CUC' => 'L',      'AUC' => 'I',      'GUC' => 'V',
  'UUA' => 'L',      'CUA' => 'L',      'AUA' => 'I',      'GUA' => 'V',
  'UUG' => 'L',      'CUG' => 'L',      'AUG' => 'M',      'GUG' => 'V',
  'UCU' => 'S',      'CCU' => 'P',      'ACU' => 'T',      'GCU' => 'A',
  'UCC' => 'S',      'CCC' => 'P',      'ACC' => 'T',      'GCC' => 'A',
  'UCA' => 'S',      'CCA' => 'P',      'ACA' => 'T',      'GCA' => 'A',
  'UCG' => 'S',      'CCG' => 'P',      'ACG' => 'T',      'GCG' => 'A',
  'UAU' => 'Y',      'CAU' => 'H',      'AAU' => 'N',      'GAU' => 'D',
  'UAC' => 'Y',      'CAC' => 'H',      'AAC' => 'N',      'GAC' => 'D',
  'UAA' => 'Stop',   'CAA' => 'Q',      'AAA' => 'K',      'GAA' => 'E',
  'UAG' => 'Stop',   'CAG' => 'Q',      'AAG' => 'K',      'GAG' => 'E',
  'UGU' => 'C',      'CGU' => 'R',      'AGU' => 'S',      'GGU' => 'G',
  'UGC' => 'C',      'CGC' => 'R',      'AGC' => 'S',      'GGC' => 'G',
  'UGA' => 'Stop',   'CGA' => 'R',      'AGA' => 'R',      'GGA' => 'G',
  'UGG' => 'W',      'CGG' => 'R',      'AGG' => 'R',      'GGG' => 'G'
}

rna = File.readlines('rosalind_prot.txt').map(&:strip)
rna = rna.join.strip
p rna

protein = []
i = 0
while(i < rna.length - 2)
  break if rna_codon_map[rna[i..i+2]] == 'Stop'
  protein << rna_codon_map[rna[i..i+2]]
  i = i + 3
end

p protein.join
