module Infura
  class << self
    def eth_block_number
      call = Call.new(:get, 'eth_blockNumber')
      call.fetch
    end

    def eth_get_balance(address:, tag: 'latest')
      call = Call.new(:get, 'eth_getBalance')
      call.params = [address, tag]
      call.fetch
    end

    def eth_get_transaction_by_hash(txhash:)
      call = Call.new(:get, 'eth_getTransactionByHash')
      call.params = [txhash]
      call.fetch
    end

    def eth_get_transaction_receipt(txhash:)
      call = Call.new(:get, 'eth_getTransactionReceipt')
      call.params = [txhash]
      call.fetch
    end

    def eth_send_raw_transaction(data:)
      call = Call.new(:post, 'eth_sendRawTransaction')
      call.params = [data]
      call.fetch
    end

    def eth_get_transaction_count(address:, tag: 'latest')
      call = Call.new(:get, 'eth_getTransactionCount')
      call.params = [address, tag]
      call.fetch
    end

    def eth_call(object:, tag: 'latest')
      call = Call.new(:get, 'eth_call')
      call.params = [object, tag]
      call.fetch
    end

    def eth_get_block_by_number(tag: 'latest', boolean: true)
      call = Call.new(:get, 'eth_getBlockByNumber')
      call.params = [tag, boolean]
      call.fetch
    end
  end
end