require "test_helper"

class InfuraTest < Minitest::Test
  def setup
    Infura.logger = Logger.new(STDOUT)
    Infura.chain = 'ropsten'
    Infura.token = 'fEgf2OPCz9nuea7QCvxn'
  end

  def test_that_it_has_a_version_number
    refute_nil ::Infura::VERSION
  end

  def test_eth_block_number
    block_number = Infura.eth_block_number
    assert_match /^0x[a-f0-9]*/, block_number
  end

  def test_eth_get_balance
    # puts [{ 'from' => '0x12345678', 'to' => '0x87654321'}, 'abcedfg'].to_json
    balance = Infura.eth_get_balance(address: '0xE7DdCa8F81F051330CA748E82682b1Aa4cd8054F')
    assert_match /^0x[a-f0-9]*/, balance
  end

  def test_eth_get_transaction_count
    count = Infura.eth_get_transaction_count(address: '0xE7DdCa8F81F051330CA748E82682b1Aa4cd8054F')
    assert_match /^0x[a-f0-9]*/, count
  end

  def test_eth_call
    data = "0x70a082310000000000000000000000005C13A82fF280Cdd8E6fa12C887652e5De1cD65a8"
    result = Infura.eth_call(object: {to: '0xda1e6a532b15f5f6d8e6504a67eadb88305ac5f9', data: data})
    assert_match /^0x[a-f0-9]+/, result
  end

  def test_eth_get_transaction_by_hash
    result = Infura.eth_get_transaction_by_hash(txhash: '0x8371b3d83220e021bea92c0928a5a75b99e9a2424df71eeb508277253659aba6')
    assert_kind_of Hash, result
  end

  def test_eth_get_transaction_receipt
    result = Infura.eth_get_transaction_receipt(txhash: '0x8371b3d83220e021bea92c0928a5a75b99e9a2424df71eeb508277253659aba6')
    assert_kind_of Hash, result
  end

  def test_eth_get_block_by_number
    result = Infura.eth_get_block_by_number
    assert_kind_of Hash, result
  end
end
