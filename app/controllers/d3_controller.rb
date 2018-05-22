class D3Controller < ApplicationController
  prepend_view_path Rails.root

  def index

    respond_to do |format|
      format.html do
        result = render(template: "#{params[:figure]}.html", layout: !(false || params[:raw]))
        result = result.gsub!('d3.v3.min.js', 'https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.17/d3.js') || result
        result = result.gsub!('.select("body")', '.select(".col")') || result

        return result
      end

      format.any(:csv, :json, :geojson) do
        send_data File.read("#{params[:figure]}.#{request.format.to_sym}")
      end

      format.js do
        send_data File.read("#{params[:figure]}.js"), type: 'application/javascript'
      end
    end
  end
end
