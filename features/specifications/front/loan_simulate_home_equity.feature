Feature: Home equity loan

Scenario: Simulate home equity loan
  Given I access the Creditas website
  When I click on Simular Emprestimo
  And I fill in the fields about the simulation
  And I fill in the fields with my personal information
  Then my registration will be successfully made