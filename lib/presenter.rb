class Presenter
  def present(data)
    data.map.with_index do |item, index|
      (index + 1).to_s
                 .concat('. ').concat(item.title)
                 .concat(' - ').concat(item.author)
                 .concat(' - ').concat(item.publisher)
    end.join("\n")
  end
end
