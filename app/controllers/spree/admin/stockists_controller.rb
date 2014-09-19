module Spree
  module Admin
    class StockistsController < ResourceController
      before_action :set_admin_stockist, only: [:show, :edit, :update, :destroy]
      before_action :build_region_array, only: [:new, :edit]

      # GET /spree/admin/stockists
      def index

        @stockists = {
          "North America" => [],
          "International" => []
        }

        stockists = Stockist.all

        stockists.each do |stockist|
          @stockists[stockist.region].push(stockist)
        end

        @north_american_stockists = Stockist.where("region = ?", 0)
        @international_stockists = Stockist.where("region = ?", 1)




      end

      # GET /spree/admin/stockists/1
      def show
        session[:return_to] ||= request.referer
        redirect_to( :action => :edit )
      end

      # GET /spree/admin/stockists/new
      def new
        @admin_stockist = Stockist.new
      end

      # GET /spree/admin/stockists/1/edit
      def edit
      end

      # POST /spree/admin/stockists
      def create
        @admin_stockist = Stockist.new(admin_stockist_params)

        if @admin_stockist.save
          redirect_to admin_stockists_path, notice: 'Stockist was successfully created.'
        else
          render :new
        end
      end

      # PATCH/PUT /spree/admin/stockists/1
      def update
        if @admin_stockist.update(admin_stockist_params)
          redirect_to admin_stockists_path, notice: 'Stockist was successfully updated.'
        else
          render :edit
        end
      end

      # DELETE /spree/admin/stockists/1
      def destroy
        @admin_stockist.destroy
        redirect_to admin_stockists_url, notice: 'Stockist was successfully destroyed.'
      end


      private
        # Use callbacks to share common setup or constraints between actions.
        def set_admin_stockist
          @admin_stockist = Stockist.find(params[:id])
        end

        def build_region_array
          # @regions_hash = Stockist.regions.collect { |region| region }
          @regions_hash = Stockist.regions.keys
        end

        # Only allow a trusted parameter "white list" through.
        def admin_stockist_params
          params.require(:stockist).permit!
        end


    end
  end
end