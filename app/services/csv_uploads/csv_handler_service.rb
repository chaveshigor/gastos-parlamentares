# frozen_string_literal: true

require 'csv'

module CsvUploads
  class CsvHandlerService < ApplicationService
    def initialize(file:)
      @file = file
    end

    def run
      read_csv
    end

    private

    attr_reader :file
    attr_accessor :row_data

    def read_csv
      store_data_service = CsvUploads::StoreDataService.new

      CSV.foreach(file.tempfile, headers: true, col_sep: ';', encoding: 'bom|utf-8', quote_char: "\"") do |row|
        @row_data = row.to_hash
        next if row_data['sgUF'] != 'RJ'
        next unless parlamentary?

        current_csv_data = capture_fields

        store_data_service.run(current_csv_data)
      end

      true
    rescue CSV::MalformedCSVError
      p 'ERROOOOOOOOOOOOOOOOOOOOOOOOOOO'
      false
    end

    def capture_fields
      {
        politician: {
          name: row_data['txNomeParlamentar'],
          cpf: row_data['cpf'],
          registration_id: row_data['ideCadastro'],
          wallet: row_data['nuCarteiraParlamentar'],
          uf: row_data['sgUF']
        },
        legislature: {
          year: row_data['nuLegislatura'],
          code: row_data['codLegislatura']
        },
        political_party: {
          name: row_data['sgPartido']
        },
        provider: {
          name: row_data['txtFornecedor'],
          cnpj_cpf: row_data['txtCNPJCPF']
        },
        expense_type: {
          code: row_data['numSubCota'],
          description: row_data['txtDescricao']
        },
        expense_specification: {
          code: row_data['numEspecificacaoSubCota'],
          description: row_data['txtDescricaoEspecificacao']
        },
        expense: {
          document_number: row_data['txtNumero'],
          document_type: row_data['indTipoDocumento'].to_i,
          generation_date: row_data['datEmissao'],
          document_value: row_data['vlrDocumento'],
          document_url: row_data['urlDocumento'],
          gloss_value: row_data['vlrGlosa'],
          net_value: row_data['vlrLiquido'],
          month: row_data['numMes'],
          year: row_data['numAno'],
          installment_number: row_data['numParcela'],
          passanger_name: row_data['txtPassageiro'],
          travel_stretch: row_data['txtTrecho'],
          lot_number: row_data['numLote'],
          reimbursement_number: row_data['numRessarcimento'],
          reimbursement_amount: row_data['vlrRestituicao']
        }
      }
    end

    def parlamentary?
      row_data['sgPartido'].present?
    end
  end
end
