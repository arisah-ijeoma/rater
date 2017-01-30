module DeviseHelper
  # Overwriting main helper for styling purposes
  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.
        errors.
        full_messages.
        map { |msg| content_tag(:p, msg) }.join


    html = <<-HTML
    <div class="alert alert-danger">
      #{messages}
    </div>
    HTML

    html.html_safe
  end
end
