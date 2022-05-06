# class to aggregate (calculate) number of DrugName's and it's Income for a given PatientName
class Aggregator
  attr_reader :stored_records

  def initialize(stored_records, counter:)
    @stored_records = stored_records
    @counter = counter
  end

  # receives { "PatientName" => { "DrugName" => ["EventName"] } }
  # counts number of Drugs and sum of incomes of each Drug and saves it to temporart aggregator
  # returns { "PatientName" => { DrugsCount => Income }
  def call
    return unless stored_records.is_a?(Hash)

    stored_records.each_with_object({}) do |(patient, prescription), aggregator|
      prescriptions = prescription.transform_values { |events| @counter.new(events).call }
      aggregator[patient] = { prescriptions.keys.count => prescriptions.values.sum }
    end
  end
end
