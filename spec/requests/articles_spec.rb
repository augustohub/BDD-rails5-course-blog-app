require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  before do
    @article = Article.create(title: 'Article One',
                              body: 'Article One content')
  end

  describe 'GET /articles/:id' do
    context 'with existing article' do
      before { get "/articles/#{@article.id}"}

      it 'handles existing article' do
        expect(response.status).to eql(200)
      end
    end

    context 'with non existing article' do
      before { get "/articles/#{@article.id + 10}" }

      it 'handles not existing article' do
        expect(response.status).to eql(404)
        flash_message = 'The article you are looking for could not be found'
        expect(flash[:alert]).to eql(flash_message)
      end
    end
  end
end
