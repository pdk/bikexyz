module ApplicationHelper

  def or_nbsp(x)
    if x.blank?
      "&nbsp;".html_safe
    else
      x
    end
  end
end
