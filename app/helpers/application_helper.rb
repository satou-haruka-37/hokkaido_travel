module ApplicationHelper
  def default_meta_tags
    {
      site: 'えぞとらべる',
      title: '北海道を、もっと身近に。',
      reverse: true,
      charset: 'utf-8',
      description: 'えぞとらべるは、北海道の新たな魅力を発見し、北海道旅行のお悩みを解決するサービスです。',
      keywords: '北海道,北海道旅行,北海道旅,旅行,旅,ほっかいどう,ほっかいどうりょこう,えぞとらべる,エゾトラベル.えぞトラベル,道内旅行,グルメ,観光,北海道観光,宿,宿泊,ホテル,旅館,ランチ,ディナー,ごはん,レジャー',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        local: 'ja-JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@lemonade_37',
        image: image_url('ogp.png')
      }
    }
  end
end
