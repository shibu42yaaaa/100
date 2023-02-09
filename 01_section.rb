# puts "stressed".reverse

# str = "パタトカクシーー"
# puts 1.step(7, 2).map{|i| str[i]}.join

# puts "パタトタカシーー".chars.select.with_index { |char, i| i.even? }.join

# strs = %w[パトカー タクシー]
# puts strs.map(&:chars).inject(&:zip).flatten.join

# puts "パトカー".chars.zip("タクシー".chars).join

# # 03 円周率
# str = "Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics."
# p str.split(/\W/).reject(&:empty?).map(&:length)


# "Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can."
# という文を単語に分解し，
# 1, 5, 6, 7, 8, 9, 15, 16, 19番目の単語は先頭の1文字，
# それ以外の単語は先頭に2文字を取り出し，取り出した文字列から単語の位置（先頭から何番目の単語か）への連想配列（辞書型もしくはマップ型）を作成せよ
str = "Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can."

str.split(/\W/).reject(&:empty?).map.with_index(1) do |str, i|
  if [1,5,6,7,8,9,15,16,19].include?(i)
    p [str.slice(0,1), i]
  else
    p [str.slice(0,2),i]
  end
end.to_h
