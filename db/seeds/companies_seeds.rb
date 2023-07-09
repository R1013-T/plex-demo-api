
  #     code: "#{n}",
  #     listing_status: false,
  #     name: "name#{n}",
  #     name_kana: "name_kana#{n}",
  #     postal_code: "postal_code#{n}",
  #     address: "address#{n}",
  #     representative_name: "representative_name#{n}",
  #     representative_name_kana: "representative_name_kana#{n}",
  #     phone: "phone#{n}",
  #     revenue_2022: 10,
  #     profit_2022: 10,
  #     revenue_2021: 10,
  #     profit_2021: 10,
  #     revenue_2020: 10,
  #     profit_2020: 10
  unless Company.exists?
    Company.create!(
      code: "202709",
      listing_status: true,
      name: "煌星商事",
      name_kana: "ｺｳｾｲｼｮｳｼﾞ",
      postal_code: "689-1221",
      address: "鳥取県鳥取市用瀬町古用瀬４５０３３",
      representative_name: "荒井　金吾",
      representative_name_kana: "ｱﾗｲ ｷﾝｺﾞ",
      phone: "0857-04-1308",
      revenue_2022: 72867868,
      profit_2022: 28965915,
      revenue_2021: 75664378,
      profit_2021: 51971670,
      revenue_2020: 26072458,
      profit_2020: 11213880
    )

    Company.create!(
      code: "930562",
      listing_status: false,
      name: "虹架橋技研",
      name_kana: "ﾆｼﾞｶｷｮｳｷﾞｹﾝ",
      postal_code: "879-0443",
      address: "大分県宇佐市葛原１－１７－１",
      representative_name: "金山　夏海",
      representative_name_kana: "ｶﾅﾔﾏ ﾅﾂﾐ",
      phone: "097-946-7743",
      revenue_2022: 83815573,
      profit_2022: 27151014,
      revenue_2021: 54883331,
      profit_2021: 45696885,
      revenue_2020: 91716685,
      profit_2020: 10957511
    )
    Company.create!(
      code: "719384",
      listing_status: true,
      name: "大地建設",
      name_kana: "ﾀﾞｲﾁｹﾝｾﾂ",
      postal_code: "689-1326",
      address: "鳥取県岩美郡岩美町本郷６－３９",
      representative_name: "山崎　泰輔",
      representative_name_kana: "ﾔﾏｻｷ ﾀｲｽｹ",
      phone: "0857-65-3492",
      revenue_2022: 98872453,
      profit_2022: 69504761,
      revenue_2021: 91233118,
      profit_2021: 78971370,
      revenue_2020: 82848310,
      profit_2020: 66343888
    )

    Company.create!(
      code: "723842",
      listing_status: false,
      name: "銀座産業",
      name_kana: "ｷﾞﾝｻﾞｻﾝｷﾞｮｳ",
      postal_code: "826-0041",
      address: "福岡県田川郡川崎町石炭田６３７５",
      representative_name: "田中　千秋",
      representative_name_kana: "ﾀﾅｶ ﾁｱｷ",
      phone: "094-889-1748",
      revenue_2022: 107243896,
      profit_2022: 45213860,
      revenue_2021: 86952137,
      profit_2021: 71640288,
      revenue_2020: 76418527,
      profit_2020: 59740572
    )
  end