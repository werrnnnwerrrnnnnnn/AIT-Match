Given("I am on the sign up page") do
  visit new_user_registration_path
end

When("I fill in valid sign up details with {string} and {string}") do |email, password|
  fill_in "e.g., st123456@ait.asia or st123456@ait.ac.th", with: email # Use the placeholder for email
  fill_in "Password", with: password
  fill_in "Password", with: password
end

When("I fill in invalid email format {string} and a valid password") do |email|
  fill_in "e.g., st123456@ait.asia or st123456@ait.ac.th", with: email
  fill_in "Password", with: "password"
  fill_in "Password", with: "password"
end

When("I fill in valid email {string} and an invalid password {string}") do |email, password|
  fill_in "e.g., st123456@ait.asia or st123456@ait.ac.th", with: email
  fill_in "Password", with: password
  fill_in "Password", with: password
end

When("I fill in valid email {string} and a blank password") do |email|
  fill_in "e.g., st123456@ait.asia or st123456@ait.ac.th", with: email
  fill_in "Password", with: ""
  fill_in "Password", with: ""
end

When("I fill in valid email {string}, password {string}, and mismatched confirmation {string}") do |email, password, password_confirmation|
  fill_in "e.g., st123456@ait.asia or st123456@ait.ac.th", with: email
  fill_in "Password", with: password
  fill_in "Password", with: password_confirmation
end

And("I click the {string} button") do |button_text|
  click_button button_text
end

Then("I should see the message {string}") do |message|
  expect(page).to have_content(message)
end

Then("I should see the error {string}") do |error_message|
  expect(page).to have_content(error_message)
end