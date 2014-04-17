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
    p url
    content = open(url).read
    doc = REXML::Document.new(content)
    title = doc.elements["//dc:title"]
    return nil unless title
    title = title.text
    edition = doc.elements["//dcndl:edition"]
    unless edition
      edition = nil
    else
      edition = " " + edition.text
    end
    authors = doc.elements.to_a("//dc:creator").map{ |e| e.first.value }
    publisher = doc.elements["//dc:publisher"].text
    subject = doc.elements["//dc:subject"]
    unless subject
      subject = nil
    else
      subject = subject.text
    end
    pubDate = doc.elements["//pubDate"].text

    { isbn: isbn, title: "#{title}#{edition}", author: authors, publisher: publisher, keyword: subject, published_at: "#{DateTime.parse(pubDate)}".gsub("-", "/") }
  end
end

if $0 == __FILE__
  p ret = NDL.search_by_isbn("9784797372274")
  p ret[:published_at]
  p DateTime.parse ret[:published_at]

end
