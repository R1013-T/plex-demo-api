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
  Company.create!(
    code: 202709,
  listing_status: true,
  name: '煌星商事',
  name_kana: 'ｺｳｾｲｼｮｳｼﾞ',
  postal_code: '689-1221',
  address: '鳥取県鳥取市用瀬町古用瀬４５０３３',
  representative_name: '荒井　金吾',
  representative_name_kana: 'ｱﾗｲ ｷﾝｺﾞ',
  phone: '0857-04-1308',
  revenue_2022: 72867868,
  profit_2022: 28965915,
  revenue_2021: 75664378,
  profit_2021: 51971670,
  revenue_2020: 26072458,
  profit_2020: 11213880,
  )
end