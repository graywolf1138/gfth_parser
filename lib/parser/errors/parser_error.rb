# basic error class for the whole application
# provides clean error warning to the output
class ParserError < StandardError
  # removing backtrace to make output easier-to-read and calling super() method
  def initialize(message = 'ParserError occured, exiting application.')
    super
    set_backtrace([])
  end
end
