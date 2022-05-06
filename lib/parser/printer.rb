# class to print values to IO
class Printer
  attr_reader :aggregated_record

  def initialize(aggregated_record)
    @aggregated_record = aggregated_record
  end

  # receives `aggregated_record` as an attribute:
  # {"PatientName" => { NumOfDrugs => Income }
  #
  # prints "PatientName" and hash of NumOfDrugs and Income
  def call
    return unless aggregated_record.is_a?(Hash) && aggregated_record.values.first.is_a?(Hash)

    aggregated_record.each do |patient, fills_income|
      p "#{patient}: #{fills_income.keys.first} fills $#{fills_income.values.first} income"
    end
  end
end
