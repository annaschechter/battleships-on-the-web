Given(/^I am on the placing_ships page$/) do
  visit '/placing_ships'
end

Then(/^I should see my board$/) do |text|
  expect(page).to have_content text
end

Then(/^I should see "(.*?)" link$/) do |link|
  expect(page).to have_content link
end

When(/^I follow "(.*?)" link$/) do |link|
	click_on link
  
end

Then(/^I go to the ships page$/) do
  visit '/ships'
end

Then(/^I see "(.*?)"$/) do |text|
  expect(page).to have_content text
end