#!/usr/bin/env ruby
$LOAD_PATH << File.expand_path('../lib', __dir__)
require 'timsach'

io = IOadapter.new($stdin, $stdout)
reading = Reading.new
search_engine = SearchEngine.new
presenter = Presenter.new
validator = Validation.new
menu = Menu.new(io, validator)

runner = Runner.new(io: io,
                    reading: reading,
                    search_engine: search_engine,
                    presenter: presenter,
                    menu: menu)

runner.main_menu_loop
