# class representing Record object to store PatientName, DrugName (prescription) and EventName
# provides corresponding methods to record object
class Record
  attr_reader :patient, :prescription, :event

  def initialize(patient, prescription, event)
    @patient = patient
    @prescription = prescription
    @event = event
  end
end
