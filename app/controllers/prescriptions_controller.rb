class PrescriptionsController < ApplicationController

  def new
    @patient = Patient.find(params[:patient_id])
    @medications = Medication.all
    @prescription = Prescription.new
  end

  def create
    @prescription = Prescription.new(prescription_params)
    @patient = Patient.find(params[:patient_id])
    @prescription.user_id = session[:user_id]
    @prescription.patient_id = params[:patient_id]
    @prescription.starts_on = parse_start_date
    @prescription.ends_on = parse_end_date

    if @prescription.save
      flash[:notice] = 'Your prescription has been created'
      redirect_to "/patients/#{@patient.id}"
    else
      flash[:error] = 'Your prescription could not be saved'
      render :new
    end
  end

  private

  def parse_start_date
    Date.civil(params[:prescription]['starts_on(1i)'].to_i, params[:prescription]['starts_on(2i)'].to_i, params[:prescription]['starts_on(3i)'].to_i)
  end

  def parse_end_date
    Date.civil(params[:prescription]['ends_on(1i)'].to_i, params[:prescription]['ends_on(2i)'].to_i, params[:prescription]['ends_on(3i)'].to_i)
  end

  def prescription_params
    params[:prescription].permit(:medication_id, :dosage, :schedule, 'starts_on(1i)', 'starts_on(2i)', 'starts_on(3i)', 'ends_on(1i)', 'ends_on(2i)', 'ends_on(3i)')
  end
end