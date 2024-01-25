module MarkdownToHtmlHelper
  def markdown_to_html(text)
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer)
    markdown.render(text).html_safe
  end

  # お知らせ一覧画面でのお知らせ本文の部分的な表示
  def markdown_to_text(text, limit)
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer)

    # マークダウンをHTMLに変換してから、マークダウン記法やHTMLタグなどを除去
    plain_text = strip_tags(markdown.render(text))

    truncate(plain_text, length: limit).html_safe
  end
end
