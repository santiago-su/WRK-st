class Client < ActiveRecord::Base
  validates_presence_of :name, :meeting_office_hours, :entry_date
  has_many :charges
  has_many :payments

  def balance
    payments.map(&:quantity).sum(0) - charges.map(&:quantity).sum(0)
  end
end
