# 投稿のサンプルデータ作成
=begin
10.times do |n|
  latitude = Faker::Address.latitude.to_f
  longitude = Faker::Address.longitude.to_f
  Post.create!(
    title: "Example Title #{n + 1}",
    address: "Example Address #{n + 1}",
    latitude: latitude,
    longitude: longitude,
    body: "This is an example post body #{n + 1}."
  )
end
=end


# タグのデータ
tags = [
  { title: 'グルメ' },
  { title: 'レジャー' },
  { title: '宿泊' },
  { title: '観光' },
  { title: 'お店' },
  { title: '道の駅' }
]

tags.each do |tag_data|
  Tag.create(tag_data)
end