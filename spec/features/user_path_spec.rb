require 'rails_helper'

describe 'the user path' do
  before() do
  user = create(:user)
  visit new_user_session_path
  fill_in 'Email', :with => 'email@email.com'
  fill_in 'Password', :with => '123456'
  click_on 'Log in'
  end

  it 'let the user create a job post' do
    click_on 'Add Your Job'
    fill_in 'Title', :with => 'This is a title'
    fill_in 'Description', :with => 'This is a description'
    click_on 'Create Job'
    expect(page).to have_content('This is a title')
  end
  it 'show you the details of the position' do
    job = create(:job)
    click_on "See All Jobs"
    click_on job.title
    expect(page).to have_content(job.description)
  end
end
