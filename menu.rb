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

class WordCounter
  def count(sentence)
    sentence.split.size
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

class InputAction
  attr_reader :input_reader

  def initialize(input_reader)
    @input_reader = input_reader
  end
end

module SentenceReadable
  def read_sentence
    input_reader.read("Write your sentence")
  end
end

class CountWordsAction < InputAction
  include SentenceReadable

  def execute
    puts read_sentence.split.size
  end
end

class CountLettersAction < InputAction
  include SentenceReadable

  def execute
    puts read_sentence.length
  end
end

class ReverseAction < InputAction
  include SentenceReadable

  def execute
    puts read_sentence.reverse
  end
end

class UppercaseAction < InputAction
  include SentenceReadable

  def execute
    puts read_sentence.upcase
  end
end

class LowercaseAction < InputAction
  include SentenceReadable

  def execute
    puts read_sentence.downcase
  end
end

class DisplaySentenceAction < InputAction
  include SentenceReadable

  def execute
    puts read_sentence
  end
end

class MenuSelectorAction < InputAction
  def initialize(input_reader, actions)
    super(input_reader)
    @actions = actions
  end

  def execute
    action_options = @actions.values.map{|action| action[:title]}.join("\n")
    option = input_reader.read("Select option:\n" + action_options)
    action = @actions[option][:action]
    action.new(input_reader).execute unless action.nil?
  end
end

ACTIONS = {'1' => {title: "1-Count Words", action: CountWordsAction},
           '2' => {title: "2-Count Letters", action: CountLettersAction},
           '3' => {title: "3-Reverse Text", action: ReverseAction},
           '4' => {title: "4-Convert To Uppercase", action: UppercaseAction},
           '5' => {title: "5-Convert To Lowercase", action: LowercaseAction},
           '6' => {title: "6-Displaying sentence", action: DisplaySentenceAction}
         }

command_line_reader = CommandLineReader.new
user_validator = UserValidator.new
my_program = MyProgramWithLogin.new(command_line_reader, user_validator)
action = MenuSelectorAction.new(command_line_reader, ACTIONS)
my_program.execute(action)
