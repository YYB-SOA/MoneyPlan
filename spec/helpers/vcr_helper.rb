# frozen_string_literal: true

require 'vcr'
require 'webmock'

# Setting up VCR
module VcrHelper
  CASSETTES_FOLDER = 'spec/fixtures/cassettes'
  PLACE_CASSETTE = 'place_api'
  CAFE_CASSETTE - 'cafe_api'

  def self.setup_vcr
    VCR.configure do |c|
      c.cassette_library_dir = CASSETTES_FOLDER
      c.hook_into :webmock
    end
  end

  def self.configure_vcr_for_place
    VCR.configure do |c|
      c.filter_sensitive_data('<PLACE_TOKEN>') { PLACE_TOKEN }
      c.filter_sensitive_data('<PLACE_TOKEN_ESC>') { CGI.escape(PLACE_TOKEN) }
    end

    VCR.insert_cassette(
      PLACE_CASSETTE,
      record: :new_episodes,
      match_requests_on: %i[method uri headers]
    )
  end
  
  def self.configure_vcr_for_cafe
    VCR.configure do |c|
      c.filter_sensitive_data('<PLACE_TOKEN>') { CAFE_TOKEN }
      c.filter_sensitive_data('<PLACE_TOKEN_ESC>') { CGI.escape(CAFE_TOKEN) }     
    end

    VCR.insert_cassette(
      CAFE_CASSETTE,
      record: :new_episodes,
      match_requests_on: %i[method uri headers]
    )
  end


  def self.eject_vcr
    VCR.eject_cassette
  end
end