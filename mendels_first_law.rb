# Homozygous dominant = D
# Homozygous recessive = R
# Heterozygous = Z

def p_of_child_allele(total_d, total_z, total_r, type_of_child)
  prob = 0
  @mating_options.each do |key, value|
    prob += @p[type_of_child][key] * value
  end
  prob
end

population = File.read('rosalind_iprb.txt').chomp.split.map(&:to_i)
m = population[0]
n = population[1]
k = population[2]
total = (m + n + k).to_f

@mating_options = { 'DD' => m/total * (m-1)/(total - 1),
                    'DR' => m/total * k/(total - 1) * 2,
                    'DZ' => m/total * n/(total - 1) * 2,
                    'RR' => k/total * (k-1)/(total - 1),
                    'RZ' => k/total * n/(total - 1) * 2,
                    'ZZ' => n/total * (n-1)/(total -1) }
@p = {}
@p[:d_child] = { 'DD' => 1,
                 'DR' => 0,
                 'DZ' => 0.5,
                 'RR' => 0,
                 'RZ' => 0,
                 'ZZ' => 0.25 }
@p[:r_child] = { 'DD' => 0,
                 'DR' => 0,
                 'DZ' => 0,
                 'RR' => 1,
                 'RZ' => 0.5,
                 'ZZ' => 0.25 }
@p[:z_child] = { 'DD' => 0,
                 'DR' => 1,
                 'DZ' => 0.5,
                 'RR' => 0,
                 'RZ' => 0.5,
                 'ZZ' => 0.5 }
p p_of_child_allele(m, n, k, :d_child) + p_of_child_allele(m,n,k, :z_child)
