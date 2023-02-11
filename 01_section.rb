puts "stressed".reverse

str = "パタトカクシーー"
puts 1.step(7, 2).map{|i| str[i]}.join

puts "パタトタカシーー".chars.select.with_index { |char, i| i.even? }.join

strs = %w[パトカー タクシー]
puts strs.map(&:chars).inject(&:zip).flatten.join

puts "パトカー".chars.zip("タクシー".chars).join

# # 03 円周率
str = "Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics."
p str.split(/\W/).reject(&:empty?).map(&:length)

# 元素記号
# "Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can."
# という文を単語に分解し，
# 1, 5, 6, 7, 8, 9, 15, 16, 19番目の単語は先頭の1文字，
# それ以外の単語は先頭に2文字を取り出し，取り出した文字列から単語の位置（先頭から何番目の単語か）への連想配列（辞書型もしくはマップ型）を作成せよ
# str = "Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can."

str.split(/\W/).reject(&:empty?).map.with_index(1) do |str, i|
  if [1,5,6,7,8,9,15,16,19].include?(i)
    p [str.slice(0,1), i]
  else
    p [str.slice(0,2),i]
  end
end.to_h

# 05. n-gram
def n_gram(sequence, n)
  sequence.each_cons(n).map(&:join)
end

chars = "I am an NLPer".chars.reject { |c| c == ''}
p n_gram(chars, 2)

words = "I am an NLPer".split
p n_gram(words, 2)

# 07. テンプレートによる文生成
# 引数x, y, zを受け取り「x時のyはz」という文字列を返す関数を実装せよ．
# さらに，x=12, y="気温", z=22.4として，実行結果を確認せよ

def template_string(x, y, z)
  # 12時の気温は22.4度です
  p "#{x}時の#{y}は#{z}度です"
end

template_string(12, "気温", 22.4)

# 08. 暗号文
# 与えられた文字列の各文字を，以下の仕様で変換する関数cipherを実装せよ．

# 英小文字ならば(219 - 文字コード)の文字に置換
# その他の文字はそのまま出力
# この関数を用い，英語のメッセージを暗号化・復号化せよ．

def cipher(plain_text)
  plain_text.chars.map { |c| c.match?(/[a-z]/) ? (219 - c.ord).chr : c }.join
end

p cipher("I am an NLPer")

p cipher("I zn zm NLPvi")


# 09. Typoglycemia
# スペースで区切られた単語列に対して，各単語の先頭と末尾の文字は残し，それ以外の文字の順序をランダムに並び替えるプログラムを作成せよ．
# ただし，長さが４以下の単語は並び替えないこととする．
# 適当な英語の文（例えば"I couldn't believe that I could actually understand what I was reading : the phenomenal power of the human mind ."）を与え，その実行結果を確認せよ
class String
  def typoglycemia
    return self if self.length <= 4
    self.chars[1..-2].shuffle.unshift(chars.first).push(chars.last).join
  end
end

str = "I couldn't believe that I could actually understand what I was reading : the phenomenal power of the human mind ."

p str.split.map(&:typoglycemia).join(' ')
