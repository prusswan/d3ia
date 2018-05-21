class D3Controller < ApplicationController
  prepend_view_path Rails.root

  def index
    respond_to do |format|
      format.html do
        result = render(template: "#{params[:figure]}.html")
        result = result.gsub!('d3.v3.min.js', 'https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.17/d3.js') || result
        result = result.gsub!('.select("body")', '.select(".col")') || result

        return result
      end
    end
  end
end
