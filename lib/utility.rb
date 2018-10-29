
module Utility

  def self.age(birth_date)
    ((Date.today - birth_date).to_f/365).round(1)
  end

end