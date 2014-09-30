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

When(/^I fill in "(.*?)" with "(.*?)"$/) do |name, anna|
     fill_in 'name', :with => 'anna'
end

When(/^I click on "(.*?)"$/) do |button|
	click_on button 
end

Then(/^I see "(.*?)"$/) do |anna|
expect(page).to have_content 'Wellcome, anna!'  
end


When(/^I don't enter name$/) do
fill_in 'name', :with => ''
end

Then(/^I return to the name page$/) do
   expect(current_path).to eq '/name'
end