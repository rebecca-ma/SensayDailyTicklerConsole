require Rails.root.parent.to_s + '/daily_tickler_handler'

class ConsoleController < ApplicationController
  def index
    @data = daily_tickler_request("get all")
  end

  def change_message
    @date = Date.parse(params[:date])
  end

  def set_message
    formatted_date = tickler_params["date(1i)"] + '-' +
                     tickler_params["date(2i)"] + '-' +
                     tickler_params["date(3i)"] + '-'
    daily_tickler_request("set",
                          formatted_date,
                          tickler_params[:message])
    redirect_to console_path
  end

  def destroy
    daily_tickler_request("delete", params[:date])
    redirect_to console_path
  end

  def destroy_range
    daily_tickler_request("delete range", params[:date])
    redirect_to console_path
  end

  private
    def tickler_params
      params.require(:tickler).permit("date(1i)", "date(2i)", "date(3i)", :message)
    end
end
