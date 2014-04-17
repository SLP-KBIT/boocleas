%w(uri open-uri rexml/document rexml/xpath pp).each do |l|
  require l
end

module NDL
  API_URL = "http://iss.ndl.go.jp/api/opensearch"
  module_function
  def search_by_isbn(isbn)
    return nil unless isbn
    q = "isbn=#{isbn}"
    url = API_URL + "?format=rss&#{URI.escape q}"
    content = open(url).read
    doc = REXML::Document.new(content)
    title = doc.elements["//dc:title"].text
    edition = doc.elements["//dcndl:edition"].text
    authors = doc.elements.to_a("//dc:creator").map{ |e| e.first }
    publisher = doc.elements["//dc:publisher"].text
    subject = doc.elements["//dc:subject"].text
    pubDate = doc.elements["//pubDate"].text

    { isbn: isbn, title: title, edition: edition, author: authors, publisher: publisher, keyword: subject, published_at: pubDate }
  end
end

if $0 == __FILE__
  p NDL.search_by_isbn "9784797372274"
end
