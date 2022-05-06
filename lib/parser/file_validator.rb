require_relative 'errors/parser_error'

# class to handle file validations (filename presence, file extension support, etc.)
class FileValidator
  FileError           = Class.new(ParserError)
  FileExtensionError  = Class.new(ParserError)
  FileEmptyError      = Class.new(ParserError)

  SUPPORTED_EXTENSIONS = %w[.txt].freeze

  # takes `file_path` as a String agrument
  # runs included validations, gracefully shows error warning in case file is invalid
  # returns Boolean value or raises ParserError exception
  def self.valid?(file_path)
    raise(FileError, 'No file provided') unless file_path
    raise(FileExtensionError, 'File extension not supported') unless SUPPORTED_EXTENSIONS.include?(File.extname(file_path))
    raise(FileError, 'File does not exist') unless File.exist?(file_path)

    true
  end
end
