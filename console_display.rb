class ConsoleDisplay
  def self.print(text)
    print text
    # required so print sends the text to the screen immediately
    $stdout.flush
    nil
  end

  def self.printn(text)
    self.print text + "\n"
  end

  def self.read_input
    gets.chomp
  end

  def self.read_number_input
    read_input.to_i
  end
end
