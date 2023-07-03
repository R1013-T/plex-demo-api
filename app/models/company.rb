class Company < ApplicationRecord
  has_many :notes

  def self.ransackable_attributes(auth_object = nil)
    %w[id code listing_status name name_kana postal_code address representative_name representative_name_kana phone revenue_2022 profit_2022 revenue_2021 profit_2021 revenue_2020 profit_2020]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[note]
  end

end
