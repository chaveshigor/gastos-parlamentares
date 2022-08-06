require 'rails_helper'
require 'cpf_faker'
require 'faker'

RSpec.describe CsvUploads::StoreDataService do
  let(:run_service) { described_class.new.run(params) }

  describe '#run' do
    context 'when params are valid' do
      let(:params) do
        {
          politician: {
            name: Faker::Name.name,
            cpf: Faker::CPF.numeric,
            registration_id: Random.rand(10**5).to_s,
            wallet: Random.rand(10**5).to_s,
            uf: 'RJ'
          },
          legislature: {
            year: '2019',
            code: '12345'
          },
          political_party: {
            name: 'ABC'
          },
          provider: {
            name: 'TIM',
            cnpj_cpf: Faker::CPF.numeric
          },
          expense_type: {
            code: '2',
            description: 'Mercado'
          },
          expense_specification: {
            code: '5',
            description: 'Rabanete'
          },
          expense: {
            document_number: '54321',
            document_type: 2,
            generation_date: '2022-03-23T00:00:00',
            document_value: '25.74',
            document_url: 'url_here',
            gloss_value: '0.00',
            net_value: '52.99',
            month: '2',
            year: '2022',
            installment_number: '0',
            passanger_name: '',
            travel_stretch: '',
            lot_number: '74125',
            reimbursement_number: '',
            reimbursement_amount: ''
          }
        }
      end

      it 'create new entities' do
        expect { run_service }.to change(Legislature, :count)
          .by(1)
          .and change(PoliticalParty, :count)
          .by(1)
          .and change(Politician, :count)
          .by(1)
          .and change(ExpenseType, :count)
          .by(1)
          .and change(ExpenseSpecification, :count)
          .by(1)
          .and change(Provider, :count)
          .by(1)
          .and change(Expense, :count)
          .by(1)
      end

      it 'dont create the same entities twice' do
        run_service

        expect { run_service }.to change(Legislature, :count)
          .by(0)
          .and change(PoliticalParty, :count)
          .by(0)
          .and change(Politician, :count)
          .by(0)
          .and change(ExpenseType, :count)
          .by(0)
          .and change(ExpenseSpecification, :count)
          .by(0)
          .and change(Provider, :count)
          .by(0)
          .and change(Expense, :count)
          .by(0)
      end
    end

    context 'when some attr is missing' do
      let(:params) do
        {
          politician: {
            name: Faker::Name.name,
            cpf: Faker::CPF.numeric,
            registration_id: Random.rand(10**5).to_s,
            wallet: Random.rand(10**5).to_s,
            uf: 'RJ'
          },
          legislature: {
            year: '2019',
            code: '12345'
          },
          political_party: {
            name: ''
          }
        }
      end

      it 'rollback every transaction' do
        expect { run_service }.to change(Legislature, :count)
          .by(0)
          .and change(PoliticalParty, :count)
          .by(0)
          .and change(Politician, :count)
          .by(0)
          .and change(ExpenseType, :count)
          .by(0)
          .and change(ExpenseSpecification, :count)
          .by(0)
          .and change(Provider, :count)
          .by(0)
          .and change(Expense, :count)
          .by(0)
      end
    end
  end
end
