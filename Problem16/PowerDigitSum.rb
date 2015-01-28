nums = (2**1000).to_s.split("")

sum = 0
nums.each do |cur|
  sum += cur.to_i
end
puts sum
