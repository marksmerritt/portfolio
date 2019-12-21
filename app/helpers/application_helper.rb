module ApplicationHelper
  def display_icon(icon: svg_name, style: "", id: "")
    path = asset_path('sprite.svg') 
    icon = icon.prepend("#icon-")
    
    content_tag(:svg, class: style, id: id) do 
      content_tag(:use, nil, 'xlink:href' => path + icon)
    end
  end

  #---------- Markdown/Syntax Highlighting ----------#

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      language ||= :ruby
      CodeRay.scan(code, language).div
    end
  end

  def markdown_to_html(text)
    coderayified = CodeRayify.new(:filter_html => true, 
                                  :hard_wrap => true)
    options = md_options

    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end


  private

  def md_options 
    {
      :fenced_code_blocks => true,
      :no_intra_emphasis => true,
      :autolink => true,
      :strikethrough => true,
      :lax_html_blocks => true,
      :superscript => true
    }
  end
end
