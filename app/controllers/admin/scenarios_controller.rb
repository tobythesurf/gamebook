class Admin::ScenariosController < AdminApplicationController
  before_action :set_scenario, only: [:show, :edit, :update, :destroy]

  # GET /scenarios
  def index
    @scenarios = Scenario.where(book_id: current_user.books.ids)
  end

  # GET /scenarios/1
  def show
    @next1 = Scenario.find_by(book_id: @scenario.book_id, scenario_no: @scenario.next_no1)
    @next2 = Scenario.find_by(book_id: @scenario.book_id, scenario_no: @scenario.next_no2)
    @next3 = Scenario.find_by(book_id: @scenario.book_id, scenario_no: @scenario.next_no3)    
  end

  # GET /scenarios/new
  def new
    @scenario = Scenario.new
  end

  # GET /scenarios/1/edit
  def edit
  end

  # POST /scenarios
  def create
    @scenario = Scenario.new(scenario_params)

    if @scenario.save
      redirect_to admin_scenarios_path, notice: 'Scenario was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /scenarios/1
  def update
    if @scenario.update(scenario_params)
      redirect_to admin_scenarios_path, notice: 'Scenario was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /scenarios/1
  def destroy
    @scenario.destroy
    redirect_to scenarios_url, notice: 'Scenario was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scenario
      @scenario = Scenario.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def scenario_params
      params.require(:scenario).permit(:scenario_no, :description, :next_no1, :next_no2, :next_no3, :book_id)
    end
end
