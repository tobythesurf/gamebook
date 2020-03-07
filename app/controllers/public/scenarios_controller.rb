class Public::ScenariosController < PublicApplicationController
  before_action :set_scenario, only: [:show, :edit, :update, :destroy]
  # GET /scenarios
  def index
    @scenarios = Scenario.all
  end

  # GET /scenarios/1
  def show
    @next1 = Scenario.find_by(book_id: @scenario.book_id, scenario_no: @scenario.next_no1)
    @next2 = Scenario.find_by(book_id: @scenario.book_id, scenario_no: @scenario.next_no2)
    @next3 = Scenario.find_by(book_id: @scenario.book_id, scenario_no: @scenario.next_no3)
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
