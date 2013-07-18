class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
    @users = User.all
  end

  def create
    @team = Team.new(params[:team])
    if @team.save
      redirect_to team_url(@team)
    else
      flash[:notices] = "You must enter a name"
      render :new
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
    @users = User.all
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(params[:team])
      redirect_to team_url(@team)
    else
      flash[:notices] = "You must enter a name"
      render :edit
    end
  end

  def destroy
    team = Team.find(params[:id])
    team.destroy
    redirect_to teams_url
  end
end