module ApplicationHelper

  def or_nbsp(x)
    if x.blank?
      "&nbsp;".html_safe
    else
      x
    end
  end
  
  def hide_email(email)
    ebits = email.split("@")
    if ebits.size != 2
      "**emailaddrparseerr**"
    else
      l1 = email[0]
      "#{l1}...@#{ebits[1]}"
    end
  end
  
  def include_sharethis?
    return @include_sharethis || false
  end
end