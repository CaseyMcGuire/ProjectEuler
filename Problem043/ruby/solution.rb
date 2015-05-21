

def main
  arr = ["0", "1", "2", "3", "4", "5","6", "7", "8", "9"]

  
  running_sum = 0
  
  arr.permutation.each do |i|
    num_str = i.reduce(:+)
    if pandigital_number?(num_str)
      running_sum += num_str.to_i
    end
  end
 
  puts running_sum
end


def pandigital_number?(number)
  is_pandigital_num = true
  divs = [2,3,5,7,11,13,17]
  divs.length.times do |i|
    #puts number[i+1..i+3] + " % " + divs[i].to_s
    if number[i+1..i+3].to_i % divs[i] != 0
      is_pandigital_num = false
      break
    end
  end
  is_pandigital_num
end

main
#puts pandigital_number?("1406357289")
