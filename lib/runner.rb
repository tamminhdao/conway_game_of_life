$LOAD_PATH << File.expand_path('../lib', __dir__)
require 'timsach'

io = IOadapter.new($stdin, $stdout)
reading = Reading.new
search_engine = SearchEngine.new
presenter = Presenter.new
validator = Validation.new
menu = Menu.new(io, validator)
answer = menu.main_menu_selection

if answer == '1'
  io.console_output('*** Reading List ***')
  io.console_output(reading.reading_list)
elsif answer == '2'
  io.console_output('Enter a book title or book author')
  search_word = io.user_input
  io.console_output('Searching...')
  result = search_engine.search(search_word)
  io.console_output(presenter.present(result))
end
