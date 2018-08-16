class EmployeesController < ApplicationController
  def destroy
    employee = Employee.find(params[:id])
    company = employee.company
    employee.destroy
    redirect_to company_path(company.id)
  end

end
