module Infura
  class InfuraCallError < StandardError; end
  class InvalidEthereumAddressError < StandardError; end

  class Call

    attr_accessor :http_method, :action, :params
    # [{ 'from' => '0x...', 'to' => '0x...' }, ...]

    BASE = 'https://api.infura.io'

    def initialize(http_method, action)
      @action = action
      @http_method = http_method
    end

    def fetch
      path = "/v1/jsonrpc/#{Infura.chain}/#{action}"
      data = {}
      data[:token] = Infura.token
      data[:params] = params.to_json if params
      conn = Faraday.new(:url => BASE)

      Infura.logger.debug "#{http_method}: #{BASE}#{path}"
      Infura.logger.debug "      params: #{params.to_json}" if params
      Infura.logger.debug "      token: #{Infura.token}"
      if http_method == :post
        body = conn.post(path, data).body
      else
        body = conn.get(path, data).body
      end
      Infura.logger.debug "      return: #{body}"
      data = JSON.parse(body)
      raise InfuraCallError, data['error'] if data['error']
      data['result']
    end


  end
end
