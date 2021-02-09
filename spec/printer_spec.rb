# frozen_string_literal: true

require 'printer'

describe 'Printer' do
  describe '#print_statement' do
    before(:each) do
      @printer = Printer.new
    end
    let(:account) { BankAccount.new }
    it 'prints a statement of the account with cash amount, date and balance' do
      allow(account).to receive(:deposit).with(100).and_return(100)
      expect(@printer.print_body(account)).to include { date :Time.new.strftime('%d/%m/%Y'), credit: 100, debit: '', balance: 100 }
    end
    it 'prints an header' do
      expect(@printer.print_header).to include { 'Statement of Account' }
    end
    it 'prints the statement' do
      allow(account).to receive(:deposit).with(100).and_return(100)
      allow(account).to receive(:withdraw).with(-50).and_return(-50)
      expect(@printer.print_body(account)).to include {
                                                date :Time.new.strftime('%d/%m/%Y'), credit: 100, temp_balance: 100
                                                date :Time.new.strftime('%d/%m/%Y'), debit: 50, temp_balance: 50
                                              }
    end
    it 'prints footer' do
      expect(@printer.print_footer).to eq ' End of statement'.center(60)
    end
  end
end
