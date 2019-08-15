module ApplicationHelper
  def display_icon(icon: svg_name, style: "", id: "")
    path = asset_path('sprite.svg') 
    icon = icon.prepend("#icon-")
    
    content_tag(:svg, class: style, id: id) do 
      content_tag(:use, nil, 'xlink:href' => path + icon)
    end
  end
end
