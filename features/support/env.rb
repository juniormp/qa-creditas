require "capybara/cucumber"
require "selenium-webdriver"
require "faker"
require "cpf_faker"
require "site_prism"

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
      'chromeOptions' => {
        'args' => ['--start-maximized']
      }
    )
  )
end

Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 60