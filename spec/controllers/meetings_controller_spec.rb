require 'rails_helper'

RSpec.describe MeetingsController, type: :controller do

  describe 'GET index' do
    it 'without sign in' do
      get :index
      expect(response).to redirect_to('/employees/sign_in')
    end

    describe 'with sign in' do
      it 'assigns @meetings' do
        meetings = Employee.first.meetings
        sign_in Employee.first
        get :index
        expect(assigns(:meetings)).to eq(meetings)
      end

      it 'renders the index template' do
        sign_in Employee.first
        get :index
        expect(response).to render_template('index')
      end
    end
  end

  describe 'GET new' do
    it 'without sign in' do
      get :new
      expect(response).to redirect_to('/employees/sign_in')
    end

    describe 'with sign in' do
      it 'assigns @meeting' do
        sign_in Employee.first
        get :new
        expect(assigns(:meeting)).to be_a_new(Meeting)
      end

      it 'renders the index template' do
        sign_in Employee.first
        get :new
        expect(response).to render_template('new')
      end
    end
  end

  describe 'POST create' do
    it 'without sign in' do
      post :create
      expect(response).to redirect_to('/employees/sign_in')
    end

    describe 'with sign in' do
      it 'create meeting' do
        sign_in Employee.first
        post :create, params:
                      {
                        meeting:
                          {
                            date: (Date.today + 10),
                            participants: 'Dev,Feroz',
                            conference_room_id: 1,
                            start_time: '09:00',
                            end_time: '10:00',
                            agenda: '',
                            title: 'Demo'
                          }
                      }
        expect(response.status).to eq(302)
      end
    end
  end

  describe 'GET edit' do
    it 'without sign in' do
      meeting = Employee.first.meetings.last
      get :edit, params: { id: meeting }
      expect(response).to redirect_to('/employees/sign_in')
    end

    describe 'with sign in' do
      it 'edit meeting' do
        meeting = Employee.first.meetings.last
        sign_in Employee.first
        get :edit, params: { id: meeting }
        expect(assigns(:meeting)).to eq(meeting)
      end

      it 'renders the index template' do
        meeting = Employee.first.meetings.last
        sign_in Employee.first
        get :edit, params: { id: meeting }
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'PUT update' do
    it 'without sign in' do
      meeting = Employee.first.meetings.last
      put :update, params: { id: meeting }
      expect(response).to redirect_to('/employees/sign_in')
    end

    describe 'with sign in' do
      it 'update meeting' do
        meeting = Employee.first.meetings.last
        sign_in Employee.first
        put :update, params:
                     {
                       id: meeting,
                       meeting:
                         {
                           date: (Date.today + 10),
                           participants: 'Anurag,OPS',
                           conference_room_id: 1,
                           start_time: '09:00',
                           end_time: '10:00',
                           agenda: '',
                           title: 'Demo'
                         }
                     }
        expect(response.status).to eq(302)
      end
    end
  end

  describe 'DELETE destroy' do
    it 'without sign in' do
      meeting = Employee.first.meetings.last
      delete :destroy, params: { id: meeting }
      expect(response).to redirect_to('/employees/sign_in')
    end

    describe 'with sign in' do
      it 'update meeting' do
        meeting = Employee.first.meetings.last
        sign_in Employee.first
        delete :destroy, params: { id: meeting }
        expect(response.status).to eq(302)
      end
    end
  end

end
