require_relative './reading'
require_relative './io_adapter'
require_relative './google_api_wrapper'

io = IOadapter.new($stdin, $stdout)
io.console_output('Welcome')

io.console_output("1. View reading list \n2. Search some book")
answer = io.user_input
reading = Reading.new
sapiens = { title: 'Sapiens', author: 'Harari', publisher: 'Harper' }
reading.add(sapiens)

if answer == '1'
  puts 'Reading List'
  puts reading.reading_list
else
  puts 'Calling Google Books API'
  GoogleBooksApiWrapper.search('Yuval Noah Harari')
end
