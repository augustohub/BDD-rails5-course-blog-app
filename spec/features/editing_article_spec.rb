require 'rails_helper'

RSpec.feature 'Editing an Article' do
  before do
    @article = Article.create(title: 'Article Title',
                              body: 'Article content body')
  end

  scenario 'user updates an article' do
    visit '/'
    click_link @article.title

    click_link 'Edit'

    fill_in 'Title', with: 'Updated Article Title'
    fill_in 'Body', with: 'Updated Article content Body'
    click_button 'Update Article'

    expect(page).to have_content('Article has been updated')
    expect(page).to have_content('Updated Article Title')
    expect(page).to have_content('Updated Article content Body')
    expect(page.current_path).to eql(article_path(@article))
  end

  scenario 'user fail to update an article' do
    visit '/'
    click_link @article.title

    click_link 'Edit'
    fill_in 'Title', with: ''
    fill_in 'Body', with: ''
    click_button 'Update Article'
    
    expect(page).to have_content('Article has not been updated')
    expect(page.current_path).to eql(article_path(@article))
  end
  
end