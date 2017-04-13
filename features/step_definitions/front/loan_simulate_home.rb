Given(/^I access the Creditas website$/) do
  visit "https://staging.creditas.com.br/emprestimo/garantia-imovel"
end

When(/^I click on Simular Emprestimo$/) do
  fill_in('loanAmount', with: '50_000')
  click_button('Simular empréstimo')
end

And(/^I fill in the fields about the simulation$/) do
  select('240 meses', from: 'financing-time-months')
  click_button('Continuar')
end

And(/^I fill in the fields with my personal information$/) do
  @password = Faker::Base.numerify('creaditas####').to_s
  fill_in('customer-full-name', with: Faker::Name.name)
  fill_in('customer-cpf', with: Faker::CPF.numeric)
  fill_in('customer-birth-date', with: '13071990')
  fill_in('lead-family-monthly-income', with:'80000')
  execute_script "jQuery('.check__input')[0].click()"
  fill_in('customer-phone', with: Faker::Base.numerify('119########'))
  fill_in('customer-additional-phone', with: Faker::Base.numerify('119########'))
  select('Refinanciamento de dívidas', from: 'lead-purpose')
  fill_in('customer-email', with: Faker::Internet.email('test'))
  fill_in('customer-password', with: @password)
  fill_in('customer-password-confirmation', with: @password)
  click_button('Continuar')
end

And(/^I fill in the fields with my property information$/) do

end

Then(/^my registration will be successfully made$/) do
  page.has_css?('input.suggestion-search', :text => 'Capybara for All', :visible => true)
  puts 'uhul'
end

