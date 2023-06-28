unless Note.exists?
  20.times do |n|
    Note.create!(
      title: "title#{n}",
      content: "content#{n}"
    )
  end
end