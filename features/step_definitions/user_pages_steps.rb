# features/step_definitions/user_pages_steps.rb
Given /^I am an unregistered user$/ do
    # go to homepage
    visit root_path
end

Given /^I am on the homepage$/ do
    # check for homepage title
    page.should have_selector('title', text: full_title(''))
end

Given /^I am not logged in$/ do
    # check for signin link
    page.should have_link('Sign in')
end

When /^I register$/ do
    visit signup_path
end

Then /^the registration modal should be visible$/ do
    # check for input form
    page.should have_selector('h1',    text: 'Sign up')
    page.should have_selector('title', text: full_title('Sign up'))
end

When /^I complete the registration form$/ do
    # fillout signup form
    # this line creates an instance variable user that is not saved to database
    @user = Factory.build(:user, name: 'example user', email: 'example@email.com')
    fill_in "Name",             with: @user.name
    fill_in "Email",            with: @user.email
    fill_in "Password",         with: @user.password
    fill_in "Confirmation", with: @user.password
    
    click_button "Create my account"
end

Then /^the registration should be complete$/ do
    page.should have_selector('div.alert.alert-success', text: 'Welcome')
    page.should have_selector('title', text: @user.name)
    
end

Then /^the registration modal should not be visible$/ do
    page.should_not have_selector('h1', text: 'Sign up')
end

Then /^I should be on the homepage$/ do
end

Then /^I should be logged in$/ do
    page.should have_link('Sign out')
end