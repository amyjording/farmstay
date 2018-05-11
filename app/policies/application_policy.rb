class ApplicationPolicy
  attr_reader :current_farmie, :record

  def initialize(current_farmie, record)
    @farmie = current_farmie
    @record = record
  end
end
