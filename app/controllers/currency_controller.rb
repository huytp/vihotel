class CurrencyController < ApplicationController
  def index
    if Currency.count == 0
      Currency.create(currency: "22,306.49")
    else
      @currency = Currency.last
    end
  end

  def update
    @currency = Currency.find(params[:id])
    if @currency.update(get_params)
      redirect_to currency_index_path
      flash[:notice] = "Thành công"
    end
  end

  protected
    def get_params
      params.require(:currency).permit(:currency)
    end
end
