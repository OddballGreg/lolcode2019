class SolutionsController < ApplicationController
  before_action :get_problem_set

  def index
  end

  def new
    @solution = Solution.new(user: current_user, problem_set: @problem_set)
  end

  def create
    @solution = Solution.new(user: current_user, problem_set: @problem_set)
    @solution.file.attach(params[:solution][:file])
    @solution.program.attach(params[:solution][:program])
    if @solution.save
      redirect_to scoreboard_index_path
    else
      render :new
    end
  end

  def show

  end

  private

  def get_problem_set
    @problem_set = ProblemSet.find(params[:problem_set_id])
  end
end
