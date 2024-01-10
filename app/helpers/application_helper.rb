module ApplicationHelper
  def show_meta_tags
    assign_meta_tags if display_meta_tags.blank?
    display_meta_tags
  end

  def assign_meta_tags(options = {})
    defaults = t('meta_tags.defaults')
    options.reverse_merge!(defaults)
    site = options[:site]
    title = options[:title]
    description = options[:description]
    keywords = options[:keywords]
    image = options[:image].presence || image_url('ogp.png')
    configs = {
      site:,
      title:,
      reverse: true,
      charset: 'utf-8',
      description:,
      keywords:,
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
        { href: image_url('icon.png'), rel: 'icon', sizes: '36x36', type: 'image/png' }, # 36x36ピクセルのAndroid Touch Icon
        { href: image_url('icon.png'), rel: 'icon', sizes: '48x48', type: 'image/png' }, # 48x48ピクセルのAndroid Touch Icon
      ],
      og: {
        site_name: site,
        title: title.presence || t('meta_tags.defaults.title'),
        description:,
        type: 'website',
        url: request.original_url,
        image:,
        local: 'ja-JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@lemonade_37',
        image:
      }
    }
    set_meta_tags(configs)
  end
end
