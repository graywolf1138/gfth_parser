# Reads and parses file content, by creating Record on each line
class Content
  attr_reader :file_path, :record, :storage

  # takes `file_path` as an agrument
  # takes Storage and Record classes to provide behavior
  def initialize(file_path, storage:, record:)
    @file_path = file_path
    @storage = storage
    @record = record
  end

  # reads file line-by-line and closes file after performing a block
  # parses each line by splitting by a set of Record attributes
  # stores parsed line object into a Storage object
  def parse
    File.foreach(file_path).each do |record|
      storage.store(parse_record(record))
    end

    storage
  end

  private

  def parse_record(record_object)
    record.new(*record_object.split(/\s+/))
  end
end
