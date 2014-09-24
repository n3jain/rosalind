def rabbits(n, k)
  return 1 if n < 3
  k * rabbits(n - 2, k) + rabbits(n - 1, k)
end

puts rabbits(5, 3)
puts rabbits(5, 1)
puts rabbits(6, 1)
puts rabbits(29, 5)
