require 'capybara'

Before do
  @url = "http://127.0.0.1:3000"
end

Given(/^I am not yet registered as "([^"]*)" with password "([^"]*)"$/) do |email, password|
  # Leaving empty for now
  # But this is tricky. I cannot register with the same credentials again,
  # and I cannot unregister. So after the first attempt all testcases will fail.
  # I could test this by trying to login. If that fails then I am not yet registers, if it
  # succeeds than I am registered.

  visit @url
  click_on('Sign in')
  fill_in('Email', :with => email)
  fill_in('editor_password', :with => password)
  expect(page).not_to have_content('Invalid email or password.')
end

When(/^I register as "([^"]*)" with password "([^"]*)"$/) do |email, password|
  visit @url
  click_on('Sign up')
  fill_in('Email', :with => email)
  fill_in('editor_password', :with => password)
  fill_in('editor_password_confirmation', :with => password)
  click_button('Sign up')
end

Then(/^I should be registered$/) do
  expect(page).to have_content('Welcome! You have signed up successfully.')
end

Given(/^I am not already registered as a user$/) do
  # Leaving empty for now
end

Then(/^I should receive an error message "([^"]*)"$/) do |arg1|
  expect(page).to have_content('1 error prohibited this editor from being saved: Email has already been taken')
end

Given(/^I am registered as "([^"]*)"$/) do |email|
  # Leaving empty for now
end

When(/^I login as "([^"]*)" with password "([^"]*)"$/) do |email, password|
  visit @url
  click_on('Sign in')
  fill_in('Email', :with => email)
  fill_in('editor_password', :with => password)
  click_button('Log in')
  #TODO The site is not consistent with Log in or Sign in. Fix.
end

Then(/^I should get a login confirmation$/) do
  expect(page).to have_content('Signed in successfully.')
end

Given(/^I am logged in as "([^"]*)"$/) do |email|
  visit @url
  expect(page).to have_content('Signed in as test@test.nl')
end

When(/^I logout$/) do
  click_on('Sign out')
end

Then(/^I should get a logout confirmation$/) do
  expect(page).to have_content('Signed out successfully.')
end
