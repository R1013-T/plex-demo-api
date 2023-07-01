unless Company.exists?
  10.times do |n|
    Company.create!(
      code: "#{n}",
      listing_status: false,
      name: "name#{n}",
      name_kana: "name_kana#{n}",
      postal_code: "postal_code#{n}",
      address: "address#{n}",
      representative_name: "representative_name#{n}",
      representative_name_kana: "representative_name_kana#{n}",
      phone: "phone#{n}",
      revenue_2022: 10,
      profit_2022: 10,
      revenue_2021: 10,
      profit_2021: 10,
      revenue_2020: 10,
      profit_2020: 10
    )
  end
end