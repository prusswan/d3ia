class D3Controller < ApplicationController
  prepend_view_path Rails.root

  def index
    respond_to do |format|
      format.html do
        render(template: "#{params[:figure]}.html")
          .gsub!('d3.v3.min.js', 'https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.17/d3.js')
      end
    end
  end
end
