home_equity = LoanSimulateHomeEquity.new

Given(/^I access the Creditas website$/) do
  visit "https://staging.creditas.com.br/emprestimo/garantia-imovel"
end

When(/^I click on Simular Emprestimo$/) do
  home_equity.loan_amount.set(33000)
  click_button('Simular empréstimo')
end

And(/^I fill in the fields about the simulation$/) do
  home_equity.loan_amount_double_check.set(3500000)
  home_equity.financing_time_months.select('240 meses')
  click_button('Continuar')
end

And(/^I fill in the fields with my personal information$/) do
  home_equity.customer_full_name.set(Faker::Name.name)
  home_equity.customer_cpf.set(Faker::CPF.numeric)
  home_equity.customer_birth_date.set('13/07/1990')
  home_equity.lead_family_monthly_income.set('800000')
  execute_script "jQuery('.check__input')[0].click()"
  home_equity.customer_phone(11987764325)
  home_equity.customer_email.set(@email)
  home_equity.customer_password.set(@password)
  home_equity.customer_password_confirmation.set(@password)
  home_equity.lead_purpose.select('Investimento')
  click_button('Continuar')
end

And(/^I fill in the fields with my property information$/) do
  home_equity.lead_real_estate_address('Avenida Paulista')
  home_equity.lead_real_estate_number('123')
  home_equity.lead_real_estate_complement('23')
  home_equity.lead_real_estate_zip_code('12345678')
  home_equity.lead_real_estate_neighborhood('Jardins')
  home_equity.lead_real_estate_city('São Paulo')
  home_equity.lead_real_estate_state.select('SP')
  home_equity.lead_real_estate_country('Brasil')
  home_equity.lead_real_estate_value('700000')
  home_equity.lead_real_estate_type.select('Apartamento')
  click_button('Continuar')
end

Then(/^my registration will be successfully made$/) do
  page.has_css?('input.suggestion-search', :text => 'Capybara for All', :visible => true)
  puts 'uhul'
end