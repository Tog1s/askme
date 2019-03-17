class UsersController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Max',
      username: 'test',
      avatar_url: 'https://tog1s.github.io/img/robert-downey-Jr.jpg')

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('20.03.2020')),
      Question.new(text: 'Чё как?', created_at: Date.parse('20.03.2020'))
    ]
    @new_question = Question.new
  end
end
