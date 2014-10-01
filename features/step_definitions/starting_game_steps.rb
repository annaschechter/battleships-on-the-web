Given(/^I am on the homepage$/) do
	visit '/'
end

When(/^I follow "(.*?)"$/) do |link|
  visit '/name'
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content text
end

Given(/^I am on the name page$/) do
  visit '/name'
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |name, text|
     fill_in 'name', :with => 'text'
end

When(/^I click on "(.*?)"$/) do |button|
	click_on button 
end


When(/^I don't enter name$/) do
fill_in 'name', :with => ''
end

Then(/^I return to the name page$/) do
   expect(current_path).to eq '/name'
end

Then(/^see "(.*?)"$/) do |text|
  "Please enter a name. What's your name?"
end


Then(/^I go to the message page$/) do
  visit '/message'
end

Then(/^I go to the place_ships page$/) do
  visit '/place_ships'
end

Given(/^there are no opponents$/) do
end
