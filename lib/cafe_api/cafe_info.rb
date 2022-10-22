# frozen_string_literal: true

# frozen_string_literal: true

require 'http'
require 'yaml'
require 'httparty'
require 'json'
require 'net/http'
require 'uri'

# question: 
# (2). 我的yaml 用ID做head分隔資料，這樣若對place_api folder中shop 或是comment設計時是否會造成困難?
# (3). 需要把它(這個檔案) 取代掉舊的cafe_api，或是用來當cafe info

def url_concat(token)
  # "https://newsapi.org/v2/top-headlines?country=tw&apiKey=#{token}"
  token
end

def get_full_url(token_category, name_of_key)
  # Added the folder 'config/secrets.yml' first
  config = YAML.safe_load(File.read('config/secrets.yml'))
  token = config[token_category][0][name_of_key]
  url_concat(token)
end

def call_cafe_url(url)
  uri = URI.parse(url)
  req = Net::HTTP::Get.new(uri.request_uri)
  https = Net::HTTP.new(uri.host, uri.port)
  https.use_ssl = true
  res = https.request(req)
  JSON.parse(res.body)
end

cafe_json = call_cafe_url(cafenomad_url) # return a json array

def json_array_to_yaml(cafe_json)
  headers = cafe_json[0].keys
  store_id = headers[0] # == 'id'
  # puts "value_keys: #{value_keys}"
  # values_num = cafe_json[0].length() -1
  ## Need Refactor
  cafe_json.map do |row_data|
    { row_data[ headers[0]] =>
                                                  {
                                                    headers[1] => row_data[headers[1]],
                                                    headers[2] => row_data[headers[2]],
                                                    headers[3] => row_data[headers[3]],
                                                    headers[4] => row_data[headers[4]],
                                                    headers[5] => row_data[headers[5]],
                                                    headers[6] => row_data[headers[6]],
                                                    headers[7] => row_data[headers[7]],
                                                    headers[8] => row_data[headers[8]],
                                                    headers[9] => row_data[headers[9]],
                                                    headers[10] => row_data[headers[10]],
                                                    headers[11] => row_data[headers[11]],
                                                    headers[12] => row_data[headers[12]],
                                                    headers[13] => row_data[headers[13]],
                                                    headers[14] => row_data[headers[14]],
                                                    headers[15] => row_data[headers[15]],
                                                    headers[16] => row_data[headers[16]],
                                                    headers[17] => row_data[headers[17]]
                                                  } }
  end.to_yaml
end

def save_yaml(yaml_hash, path)
  File.write(path, yaml_hash)
end

def main(token_category, name_of_key, output_path)
  cafenomad_url = get_full_url(token_category, name_of_key)
  cafe_json = call_cafe_url(cafenomad_url)
  cafe_yaml = json_array_to_yaml(cafe_json)
  save_yaml(cafe_yaml, output_path)
  cafe_yaml
end

main('CAFE_NOMAD', 'Cafe_api', 'db/sample/cafe_nomad.yml')
# question: 我的yaml 用ID做head分隔資料，這樣若對place_api folder中shop 或是comment設計時是否會造成困難?


# spec??