ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
  "<div style=\"display:none;\" class=\"field_whith_errors\"></div> #{html_tag}".html_safe
end

