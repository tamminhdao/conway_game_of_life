class SearchEngine
  def search(keyword)
    api_result = GoogleBooksApiWrapper.search(keyword)
    api_result.items.map do |item|
      data = item.volume_info
      Book.new(title: data&.title,
               author: data&.authors&.join(', '),
               publisher: data&.publisher)
    end
  end
end
