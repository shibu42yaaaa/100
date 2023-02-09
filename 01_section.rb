puts "stressed".reverse

str = "パタトカクシーー"
puts 1.step(7, 2).map{|i| str[i]}.join

puts "パタトタカシーー".chars.select.with_index { |char, i| i.even? }.join

strs = %w[パトカー タクシー]
puts strs.map(&:chars).inject(&:zip).flatten.join

puts "パトカー".chars.zip("タクシー".chars).join

# 03 円周率
str = "Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics."
p str.split(/\W/).reject(&:empty?).map(&:length)
