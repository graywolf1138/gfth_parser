require_relative 'parser/file_validator'
require_relative 'parser/storage'
require_relative 'parser/content'
require_relative 'parser/record'
require_relative 'parser/income_counter'
require_relative 'parser/aggregator'
require_relative 'parser/printer'

# worker class that combines all the logic together
class Parser
  attr_reader :file_name

  # initializing with attributes and classes as attributes
  # classes can be moved to another file to be in line with DI principle
  def initialize(file_name, **options)
    @file_name = file_name
    @file_validator = options.fetch(:file_validator, FileValidator)
    @storage = options.fetch(:storage, Storage.new)
    @record = options.fetch(:record, Record)
    @content = options.fetch(:content, Content)
    @counter = options.fetch(:counter, IncomeCounter)
    @aggregator = options.fetch(:aggregator, Aggregator)
    @printer = options.fetch(:printer, Printer)
  end

  # performing steps to:
  # - validate file and it's integrity
  # - parse file content
  # - aggregate records (collect number of prescriptions and it's income)
  # - print gracefully to output
  def perform
    file_valid?
    parse_file_content
    print_to_output(aggregated_records)
  end

  private

  attr_reader :file_validator, :content, :record, :counter, :storage, :aggregator, :printer

  def file_valid?
    reutrn unless file_validator.valid?(file_name)
  end

  def parse_file_content
    content.new(file_name, storage: storage, record: record).parse
  end

  def aggregated_records
    aggregator.new(storage.records, counter: counter).call
  end

  def print_to_output(aggregated_data)
    printer.new(aggregated_data).call
  end
end
