require 'rails_helper'

describe 'the worker paths' do
  before() do
    worker = create(:worker)
    visit new_worker_session_path
    fill_in 'Email', :with => 'email@email.com'
    fill_in 'Password', :with => '123456'
    click_on 'Log in'
  end
  it 'allows a worker to select a job', js: true do
    job = create(:job)
    visit root_path
    click_on "See All Jobs"
    click_on 'click here to claim it now'
    expect(page).to have_content "Job2:"
  end
end
