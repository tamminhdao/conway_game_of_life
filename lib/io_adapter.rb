class IOadapter
  attr_reader :input, :output

  def initialize(input, output)
    @input = input
    @output = output
  end

  def user_input
    input.gets.chomp
  end

  def console_output(message)
    output.puts message
  end
end
