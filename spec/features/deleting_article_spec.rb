require 'rails_helper'

RSpec.feature 'Deleting an Article' do
  before do
    @article = Article.create(title: 'Article Title',
                              body: 'Article content body')
  end

  scenario 'A user deletes an article' do
    visit '/'
    click_link @article.title

    click_link 'Delete'

    expect(current_path).to eql(articles_path)
    expect(page).to have_content('Article has been deleted')

  end
end
