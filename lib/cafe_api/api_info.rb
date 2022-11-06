# frozen_string_literal: true

module CafeNomad
  class ApiInfo
    def initialize(cofanomad_data)
      @cofanomad_data = cofanomad_data
    end

    def id
      @cofanomad_data['id']
    end

    def name
      @cofanomad_data['name']
    end

    def city
      @cofanomad_data['city']
    end

    def wifi
      @cofanomad_data['wifi']
    end

    def seat
      @cofanomad_data['seat']
    end

    def quiet
      @cofanomad_data['quiet']
    end

    def tasty
      @cofanomad_data['tasty']
    end

    def cheap
      @cofanomad_data['cheap']
    end

    def music
      @cofanomad_data['music']
    end

    def url
      @cofanomad_data['url']
    end

    def address
      @cofanomad_data['address']
    end

    def latitude
      @cofanomad_data['latitude']
    end

    def longitude
      @cofanomad_data['longitude']
    end

    def limited_time
      @cofanomad_data['limited_time']
    end

    def socket
      @cofanomad_data['socket']
    end

    def standing_desk
      @cofanomad_data['standing_desk']
    end

    def mrt
      @cofanomad_data['mrt']
    end

    def open_time
      @cofanomad_data['open_time']
    end
  end
end
