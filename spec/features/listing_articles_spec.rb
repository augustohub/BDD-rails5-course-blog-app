require 'rails_helper'

RSpec.feature 'Listing Articles' do

  before do
    @article1 = Article.create(title: 'Article 1', body: 'Body of Article 1')
    @article2 = Article.create(title: 'Article 2', body: 'Body of Article 2')
  end

  scenario 'A user list all articles' do
    visit '/'

    expect(page).to have_content(@article1.title)
    expect(page).to have_link(@article1.title)
    expect(page).to have_content(@article1.body)

    expect(page).to have_content(@article2.title)
    expect(page).to have_link(@article2.title)
    expect(page).to have_content(@article2.body)

  end

  scenario 'A user has no articles' do
    Article.delete_all

    visit '/'

    expect(page).not_to have_content(@article1.title)
    expect(page).not_to have_link(@article1.title)
    expect(page).not_to have_content(@article1.body)

    expect(page).not_to have_content(@article2.title)
    expect(page).not_to have_link(@article2.title)
    expect(page).not_to have_content(@article2.body)

    within("#no-articles") do
      expect(page).to have_content('No articles created')
    end

  end
end
