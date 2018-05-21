class D3Controller < ApplicationController
  prepend_view_path Rails.root

  def index
    render template: "#{params[:figure]}.html"
  end
end
