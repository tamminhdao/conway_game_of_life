require 'spec_helper'

describe Runner do
  before(:each) do
    @reading = Reading.new
    @search_engine = SearchEngine.new
    @presenter = Presenter.new
    @validator = Validation.new
  end

  context 'when the user choose to quit the program' do
    it 'ends up with an empty reading list' do
      input = StringIO.new('3')
      output = StringIO.new
      io = IOadapter.new(input, output)
      menu = Menu.new(io, @validator)

      runner = Runner.new(io: io,
                          reading: @reading,
                          search_engine: @search_engine,
                          presenter: @presenter,
                          menu: menu)

      runner.main_menu_loop

      expect(@reading.reading_list).to eq([])
    end
  end

  context 'when the user wants to see the reading list' do
    it 'presents the reading list' do
      input = StringIO.new("1\n3\n")
      output = StringIO.new
      io = IOadapter.new(input, output)
      menu = Menu.new(io, @validator)

      runner = Runner.new(io: io,
                          reading: @reading,
                          search_engine: @search_engine,
                          presenter: @presenter,
                          menu: menu)

      runner.main_menu_loop

      expect(@reading.reading_list).to eq([])
      expect(output.string).to include('You have 0 book(s) in your reading list')
    end
  end

  context 'when the user wants to search and add a book to the list' do
    it 'finds the book and add it to the list' do
      input = StringIO.new("2\n\Harry Potter\nY\n1\nNo\n3")
      output = StringIO.new
      io = IOadapter.new(input, output)
      menu = Menu.new(io, @validator)

      runner = Runner.new(io: io,
                          reading: @reading,
                          search_engine: @search_engine,
                          presenter: @presenter,
                          menu: menu)

      book = Book.new(title: 'Harry Potter', author: 'JK Rowling', publisher: 'Pottermore')

      allow(@search_engine).to receive(:search).and_return([book])
      runner.main_menu_loop

      expect(@reading.reading_list.length).to eq(1)
      expect(output.string).to include('You have 1 book(s) in your reading list')
      expect(output.string).to include("1. Harry Potter - JK Rowling - Pottermore\n")
    end
  end
end
