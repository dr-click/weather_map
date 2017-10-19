class EnquiriesController < ApplicationController
  before_action :set_enquiry, only: [:show]

  # GET /enquiries/1
  # GET /enquiries/1.json
  def show
    @weather_enquiry = @enquiry.weather_enquiry
    flash.now[:alert] = "Enquiry Not Found, Please Search Again !!" unless @enquiry.has_data?
  end

  # GET /enquiries/new
  def new
    @enquiry = Enquiry.new
  end

  # POST /enquiries
  # POST /enquiries.json
  def create
    @enquiry = Enquiry.new(enquiry_params)
    respond_to do |format|
      if @enquiry.valid?
        @enquiry = WeatherApi::WeatherEnquiry.find(@enquiry.country, @enquiry.city)
        if @enquiry.has_data?
          flash[:notice] = "Enquiry was successfully created"
        else
          flash[:alert] = "Enquiry Not Found, Please Search Again !!"
        end

        format.html { redirect_to @enquiry}
        format.json { render :show, status: :created, location: @enquiry }
      else
        format.html { render :new }
        format.json { render json: @enquiry.errors, status: :unprocessable_entity }
      end
    end
  end


  #######
  private
  #######

    # Use callbacks to share common setup or constraints between actions.
    def set_enquiry
      @enquiry = Enquiry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enquiry_params
      params.require(:enquiry).permit(:country, :city)
    end
end
