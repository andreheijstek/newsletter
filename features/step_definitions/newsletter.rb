require 'pry'

Before do
  @url = "http://127.0.0.1:3000"
  end

When(/^I enter text on "([^"]*)", date as (\d+), "([^"]*)", (\d+), time1 as (\d+), (\d+), time2 as (\d+), (\d+), "([^"]*)" and "([^"]*)"$/) do | welcome, year, month, day, hour1, minute1, hour2, minute2, announcement, liturgy |
  visit @url
  click_on('Zondagsbrieven')
  click_on('New Letter')

  fill_in('Welcome', :with => welcome)
  select year, from: 'letter_date_1i'
  select month, from: 'letter_date_2i'
  select day, from: 'letter_date_3i'
  select hour1, from: 'letter_time1_4i'
  select minute1, from: 'letter_time1_5i'
  select hour2, from: 'letter_time2_4i'
  select minute2, from: 'letter_time2_5i'

  fill_in('Announcements', :with => announcement)
  fill_in('Liturgy', :with => liturgy)

  click_button('Create Letter')
end

Then(/^I want to see a confirmation message$/) do
  expect(page).to have_content('Letter was successfully created.')
end

Then(/^I want to see the same data in the JSON page: "([^"]*)", (\d+), "([^"]*)", (\d+), (\d+), (\d+), (\d+), (\d+), "([^"]*)", "([^"]*)"$/) do | welcome, year, month, day, hour1, minute1, hour2, minute2, announcement, liturgy |
  visit "#{@url}/letters.json"
  # Op deze pagina, vind de laatste entry en controleer dat alle juiste waarden erin staan.
  # TODO Ik ga dit nu niet verder uitwerken, want de JSON API moet toch helemaal anders gemaakt worden,
  # zie taak in Wunderlist
end