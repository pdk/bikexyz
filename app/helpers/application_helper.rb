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

  def flash_class(level)
    case level
    when :notice then "info"
    when :error then "danger"
    when :alert then "warning"
    when :success then "success"
    else level.to_s   # not defined in bootstrap, but pass it along just in case
    end
  end

  def error_message_for(resource, field, label, options = {:help_text => ""})
    error_message = resource.errors[field][0]
    if error_message.present?
      raw %{<p class="text-danger margin-top-5">#{label} #{error_message}</p>}
    elsif options[:help_text].present?
      raw %{<span class="help-block">#{options[:help_text]}</span>}
    end
  end
  
  def has_error?(resource, field)
    if resource.errors[field].present?
      "has-error"
    else
      ""
    end
  end
  
  def is_front_page?
    @is_front_page || false
  end
  
  def do_show_copyright?
    not (@hide_copyright || false)
  end
  
  def include_stripe_js?
    @include_stripe_js || false
  end
end