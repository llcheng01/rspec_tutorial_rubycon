#bank_manager/lib/bank.rb

class Bank
    attr_accessor :branch_name, :assets
    attr_accessor :accounts, :liability

    def initialize(branch_name="", assets=0.0)
        @branch_name = branch_name
        @assets = assets
        @accounts = []
        @liability = 0.0
    end

    def open_an_account(account)
        if account.instance_of?(Account)
            self.accounts << account
        else
            raise "Can't open an account with improper object"
        end
    end

    # def deposit(account, amount)
    #     # Make array into Hash for fast retrieval
    #     if @accounts.instance_of? Array
    #         h = Hash[*@accounts.map {|a|[a.account_number, a]}.flatten]
    #         acc = h[account.account_number] unless acc.nil?
    #         # how to get balance?
    #         self.liability += amount
    #     end
    # end


end
