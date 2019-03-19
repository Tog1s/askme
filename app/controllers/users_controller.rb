class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Vadim',
        username: 'installero',
        avatar_url: 'https://secure.gravatar.com/avatar/' \
          '71269686e0f757ddb4f73614f43ae445?s=100'
      ),
      User.new(id: 2, name: 'Misha', username: 'aristofun')
    ]
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
