require 'rails_helper'

RSpec.describe "Expenses", type: :request do

before do
  user = User.create!(email: "admin@admin.com", password: "password", user_type: "Admin")
  post login_url, params: {email: user.email, password: user.password}
end

  describe "GET /new" do
    it "returns http success" do
      get "/expenses/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "displays all expenses" do
      get "/expenses"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /expenses" do
    it "creates expenses" do
      post "/expenses", params: {expense: {purpose: "Electricity", amount: 150, expense_date: "2021-01-27 13:16:59"}}

      result = Expense.last
      expect(result.purpose).to eq('Electricity')
      expect(response).to redirect_to expenses_path
    end
  end

end
