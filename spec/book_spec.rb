require 'spec_helper'

describe Book do
  it 'sets attribute to N/A if encounter nil' do
    book = Book.new(author: 'A', title: 'B', publisher: nil)
    expect(book.publisher).to eq('N/A')
  end

  it 'sets attribute to N/A if attribute is missing' do
    book = Book.new(author: 'A', title: 'B')
    expect(book.publisher).to eq('N/A')
  end
end
