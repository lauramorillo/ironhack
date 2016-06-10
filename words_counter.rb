class CommandLineReader
  def read(message)
    puts message
    gets.chomp
  end
end

class UserValidator
  def valid?(user, password)
    user == "Laura" && password == "Laura"
  end
end

class MyProgramWithLogin
  def initialize(input_reader, user_validator)
    @input_reader = input_reader
    @user_validator = user_validator
  end

  def execute(action)
    user = @input_reader.read("Write your username")
    password = @input_reader.read("Write your pasword")
    if @user_validator.valid?(user, password)
      action.execute
    end
  end
end

class CountWordsAction
  def initialize(input_reader)
    @input_reader = input_reader
  end

  def execute
    sentence = @input_reader.read("Write your sentence")
    puts sentence.split.size
  end
end

command_line_reader = CommandLineReader.new
user_validator = UserValidator.new
my_program = MyProgramWithLogin.new(command_line_reader, user_validator)
my_program.execute(CountWordsAction.new(command_line_reader))
