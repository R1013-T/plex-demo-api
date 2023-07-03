class Note < ApplicationRecord
  belongs_to :user
  belongs_to :company

  def self.ransackable_attributes(auth_object = nil)
    %w[id title content user_id company_id created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[user company]
  end

end
