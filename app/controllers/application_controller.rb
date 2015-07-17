class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render_error(404)
  end


  def render_error(status)
    head 404, "content_type" => 'text/plain'
  end
end
