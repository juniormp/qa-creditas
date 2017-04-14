Before do
	@password = Faker::Base.numerify('creaditas####').to_s
	@cpf = Faker::CPF.numeric
	@email = Faker::Internet.email('test').to_s

	puts @password
	puts @cpf
	puts @email
end