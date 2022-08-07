# frozen_string_literal: true

FactoryBot.define do
  factory :expense do
    document_number { Random.rand(10**5).to_s }
    document_type { Random.rand(0...5) }
    generation_date { Time.zone.today }
    document_value { Random.rand(1...10**4).to_d }
    document_url { 'boleto_url' }
    gloss_value { Random.rand(0...10**4).to_d }
    net_value { Random.rand(1...10**4).to_d }
    month { Random.rand(1...13) }
    year { Random.rand(2018...2023) }
    installment_number { 1 }
    lot_number { Random.rand(10**5).to_s }
    expense_type { build(:expense_type) }
    provider { build(:provider) }

    trait :with_passanger do
      after(:build) do |expense|
        expense.passanger_name = Faker::Name.name
        expense.travel_stretch = 'SDU/CWB'
      end
    end

    trait :with_reimbursement do
      after(:build) do |expense|
        expense.reimbursement_number = Random.rand(0...3)
        expense.reimbursement_amount = Random.rand(1...10**4)
      end
    end
  end
end
