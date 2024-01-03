# 投稿のサンプルデータ作成
# 10.times do |n|
#   latitude = Faker::Address.latitude.to_f
#   longitude = Faker::Address.longitude.to_f
#   Post.create!(
#     title: "Example Title #{n + 1}",
#     address: "Example Address #{n + 1}",
#     latitude: latitude,
#     longitude: longitude,
#     body: "This is an example post body #{n + 1}."
#   )
# end

# タグのデータ
# tags = [
#   { title: 'グルメ' },
#   { title: 'レジャー' },
#   { title: '宿泊' },
#   { title: '観光' },
#   { title: 'お店' },
#   { title: '道の駅' }
# ]

# tags.each do |tag_data|
#   Tag.create(tag_data)
# end

# 観光時期のデータ
# seasons = [
#   { title: '1月' },
#   { title: '2月' },
#   { title: '3月' },
#   { title: '4月' },
#   { title: '5月' },
#   { title: '6月' },
#   { title: '7月' },
#   { title: '8月' },
#   { title: '9月' },
#   { title: '10月' },
#   { title: '11月' },
#   { title: '12月' }
# ]

# seasons.each do |season_data|
#   Season.create(season_data)
# end