module Responder
  extend ActiveSupport::Concern

  included do
    responders :flash, :http_cache
    respond_to :html, :js, :json, :turbo_stream
  end

  def respond_with_save(object, option = {})
    file = option[:default].present? ? 'application/save' : 'save'
    respond_with(object) do |format|
      format.js { render file, locals: { object: object } }
      format.json { render file, locals: { object: object } } unless object&.errors.present?
    end
  end

  def respond_with_turbo(object, option = {})
    respond_to do |format|
      if object&.errors.present?
        file = option[:file].present? ? option[:file] : "#{object.class.table_name}/form"
        format.turbo_stream { render turbo_stream: turbo_stream.replace(object, partial: file, locals: { object: object }) } if params[:action] == 'create'
        format.html { render render_action(params[:action]), status: :unprocessable_entity }
      else
        if option[:redirect].present?
          format.turbo_stream { redirect_to "/#{object.class.table_name}" }
        else
          format.turbo_stream
        end
        # format.html { redirect_to items_path, notice: "Item was successfully created." }
      end
    end
  end

  def render_action(a)
    case a
    when 'create'
      'new'
    when 'update'
      'edit'
    end
  end

end
