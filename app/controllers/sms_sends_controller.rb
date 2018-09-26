require './AfricasTalkingGateway'
class SmsSendsController < ApplicationController
  def new
    @at = SmsSend.new
    @contact = Contact.find_by(id: params[:id])
  end
  def create
    @at = SmsSend.create(sms_params)
    if @at.save!
      @con = current_user.contacts.find_by(id: @at.contact_id)
      AfricasTalkingGateway.new("trial-error", "29f7557bfacfe4335ea850fc3fe258b7f70064d069a014e39d5d2eece16659a9").sendMessage(@con.phonenumber, @at.message)
      redirect_to contacts_path
      flash[:success] = "Message Successfully sent to #{@con.first_name}!"
    end
  end
  def new_all
    @at = SmsSend.new
    @contact = Contact.find_by(id: params[:id])
  end
  def create_all
    @at = SmsSend.create(sms_params)
    if @at.save!
      current_user.contacts.each do |c|
        AfricasTalkingGateway.new("trial-error", "29f7557bfacfe4335ea850fc3fe258b7f70064d069a014e39d5d2eece16659a9").sendMessage(c.phonenumber, @at.message)
      end
      redirect_to contacts_path
      flash[:success] = "Message Successfully sent to all your contacts!"
    end
  end

  private
  def sms_params
    params.require(:sms_send).permit(:mobile, :message, :contact_id)
  end
end
