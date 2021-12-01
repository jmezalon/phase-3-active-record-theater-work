class Audition < ActiveRecord::Base
  belongs_to :role

  def get_role
    self.role.character_name
  end

  def callback
    self.update(hired: true)
  end
end