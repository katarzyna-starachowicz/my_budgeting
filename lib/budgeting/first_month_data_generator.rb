module Budgeting
  class FirstMonthDataGenerator
    def call
      {
        beginning_of_month: Time.now.beginning_of_month,
        id: SecureRandom.uuid
      }
    end
  end
end
