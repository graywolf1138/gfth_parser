# storage object, stores Record objects with PatientName, DrugName, EventName
class Storage
  attr_reader :records

  # initialized with empty Hash, stores keys and values pair during the process of file content parsing
  def initialize
    @records = {}
  end

  # storing Record object: create a new record or update existing one
  def store(record)
    if patient_exists(record)
      records[record.patient][record.prescription] = update_record(record)
    else
      new_record(record)
    end

    records
  end

  private

  def patient_exists(record)
    records[record.patient]
  end

  def update_record(record)
    records[record.patient][record.prescription] ? records[record.patient][record.prescription].push(record.event) : [record.event]
  end

  def new_record(record)
    records[record.patient] = { record.prescription => [record.event] }
  end
end
