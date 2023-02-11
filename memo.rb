# 後ろにaがある文字をまとめて取得

str = "apple, orange, banana, melon, apple, pineapple"

str.scan(/.a/) do |item|
  p item
end

