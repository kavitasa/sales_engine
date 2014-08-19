require_relative 'test_helper'
require_relative '../lib/transaction'

class TransactionTest < Minitest::Test

  def setup
    skip
    @transaction = Transaction.new
  end

  def test_it_can_load_a_file
    skip
    @transaction.load_content("transactions.csv")
    # assert that the file contains the seven specific headers
  end

  def test_file_exists
    skip
    assert true, @transaction.file_exist?("transactions.csv")
  end



end
