require 'rails_helper'

RSpec.feature 'Listing Articles' do

  before do
    @article1 = Article.new(title: 'Article 1', body: 'Body of Article 1')
    @article2 = Article.new(title: 'Article 2', body: 'Body of Article 2')
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
end
