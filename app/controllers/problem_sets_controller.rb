class ProblemSetsController < ApplicationController
  before_action :check_admin, except: :index

  def index
    @problem_sets = ProblemSet.all
  end

  def new
    @problem_set = ProblemSet.new
  end

  def create
    @problem_set = ProblemSet.new
    @problem_set.file.attach(params[:problem_set][:file])
    @problem_set.name = @problem_set.file.filename.to_s
    if @problem_set.save
      redirect_to problem_sets_path
    else
      render :new
    end
  end

  private

  def check_admin
    redirect_to root_path unless current_user.admin
  end
end
