# frozen_string_literal: true

require 'roda'
require 'slim'

module CafeMap
  # Web App
  class App < Roda
    plugin :render, engine: 'slim', views: 'app/views'
    plugin :assets, css: 'style.css', path: 'app/views/assets'
    plugin :common_logger, $stderr
    plugin :halt
    plugin :status_handler

    status_handler(404) do
      view('404')
    end
    route do |routing|
      routing.assets # load CSS
      response['Content-Type'] = 'text/html; charset=utf-8'

      stores_data = CafeMap::CafeNomad::InfoMapper.new(CAFE_TOKEN_NAME).load_several
      
      # GET /
      routing.root do
        view 'home' #, locals: { topics: stores_data }
      end

      routing.on 'storelist' do
        routing.is do
          # POST /storelist/
          routing.post do
            # Show error 400 if the  user input is illigal
            user_wordterm =routing.params['region']
            city_arr = %w[新竹 台北 宜蘭 臺北 新北 桃園 苗栗 台中 嘉義 台南 台東 花蓮 南投]
            routing.halt 404 unless city_arr.any?(wordterm) &&
                                   (wordterm.split(/ /).count >= 2)
            
            # Filtered
            region = city_arr.select{ |city| city== user_wordterm}

            # stores_list = stores_data.select { |obj| obj.address.include? user_wordterm }.map(&:name)
            
            routing.redirect "Cafe-Map/regional"
            end
          end
        routing.is do
          # GET /cafe/storename
          routing.get do

            view 'storelist' #, locals: { storelist: region }

          end
        end
      end
    end
  end
end
