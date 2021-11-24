class ApplicationResponder < ActionController::Responder
  include Responders::FlashResponder
  include Responders::HttpCacheResponder

  # Redirects resources to the collection path (index action) instead
  # of the resource path (show action) for POST/PUT/DELETE requests.
  # include Responders::CollectionResponder

  # def to_turbo_stream
  #   if !get? && has_errors?
  #     turbo_stream_to_html
  #   else
  #     to_format
  #   end
  # end

  def to_turbo_stream
    controller.render(options.merge(formats: :html))
  rescue ActionView::MissingTemplate => error
    if get?
      raise error
    elsif has_errors? && default_action
      turbo_stream_to_html
    else
      # turbo_stream_to_html
      redirect_to navigation_location
    end
  end

  def turbo_stream_to_html
    controller.render(
      error_rendering_options.merge(formats: :html, status: :unprocessable_entity)
    )
  end

end
