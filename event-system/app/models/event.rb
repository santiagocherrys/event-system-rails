class Event < ApplicationRecord

  #validations 
  validates :name, presence: true, length: {maximum: 150}
  validates :date, presence: true

  #callbacks
  before_save :check_date

  #scopes
  scope :_30_days_range, -> {where("date <= ?" , (Date.today + 30))}
  scope :_filter_by_concierto, -> {where("name = 'concierto'")}
  
  
  private

  #checks that incoming date is equal or greater than today
  def check_date

    puts "esta es la fecha #{self.date}"
    puts "ESTO ES LA COMPARACIÓN #{self.date < Date.today}"
    if self.date < Date.today
      errors.add(:date, ":(Param) -> you can not save an old date, must be today or later")
      throw(:abort)
    end

  end


end
