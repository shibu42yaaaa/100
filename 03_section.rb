require 'zlib'
require 'json'

def gzip2hash(filename: 'jawiki-country.json.gz')
  articles = {}
  
  Zlib::GzipReader.open(filename) do |lines|
      lines.each do |line|
      article = JSON.parse(line)
      articles[article['title']] = article['text']
      end
  end

  articles
end

# puts gzip2hash["イギリス"]

# -------------------------------------

# 記事中でカテゴリ名を宣言している行を抽出せよ

# article = gzip2hash["イギリス"]

# article.each_line do |line|
#   puts line if line.include?("Category")
# end

# 記事から参照されているメディアファイルをすべて抜き出せ．

article = gzip2hash["イギリス"]

puts article.scan(/(?:ファイル|file):(.+?)\|/)