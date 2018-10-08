require 'rails_helper'

RSpec.describe RoomsController, type: :controller do
  describe 'GET index' do
    it 'without sign in' do
      get :index
      expect(response).to redirect_to('/employees/sign_in')
    end

    describe 'with sign in' do
      it 'assigns @rooms' do
        rooms = ConferenceRoom.all
        sign_in Employee.first
        get :index
        expect(assigns(:rooms)).to eq(rooms)
      end

      it 'renders the index template' do
        sign_in Employee.first
        get :index
        expect(response).to render_template('index')
      end
    end

  end
end
