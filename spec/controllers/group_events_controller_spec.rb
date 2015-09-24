require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe GroupEventsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # GroupEvent. As you add validations to GroupEvent, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GroupEventsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all group_events as @group_events" do
      group_event = GroupEvent.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:group_events)).to eq([group_event])
    end
  end

  describe "GET #show" do
    it "assigns the requested group_event as @group_event" do
      group_event = GroupEvent.create! valid_attributes
      get :show, {:id => group_event.to_param}, valid_session
      expect(assigns(:group_event)).to eq(group_event)
    end
  end

  describe "GET #new" do
    it "assigns a new group_event as @group_event" do
      get :new, {}, valid_session
      expect(assigns(:group_event)).to be_a_new(GroupEvent)
    end
  end

  describe "GET #edit" do
    it "assigns the requested group_event as @group_event" do
      group_event = GroupEvent.create! valid_attributes
      get :edit, {:id => group_event.to_param}, valid_session
      expect(assigns(:group_event)).to eq(group_event)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new GroupEvent" do
        expect {
          post :create, {:group_event => valid_attributes}, valid_session
        }.to change(GroupEvent, :count).by(1)
      end

      it "assigns a newly created group_event as @group_event" do
        post :create, {:group_event => valid_attributes}, valid_session
        expect(assigns(:group_event)).to be_a(GroupEvent)
        expect(assigns(:group_event)).to be_persisted
      end

      it "redirects to the created group_event" do
        post :create, {:group_event => valid_attributes}, valid_session
        expect(response).to redirect_to(GroupEvent.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved group_event as @group_event" do
        post :create, {:group_event => invalid_attributes}, valid_session
        expect(assigns(:group_event)).to be_a_new(GroupEvent)
      end

      it "re-renders the 'new' template" do
        post :create, {:group_event => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested group_event" do
        group_event = GroupEvent.create! valid_attributes
        put :update, {:id => group_event.to_param, :group_event => new_attributes}, valid_session
        group_event.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested group_event as @group_event" do
        group_event = GroupEvent.create! valid_attributes
        put :update, {:id => group_event.to_param, :group_event => valid_attributes}, valid_session
        expect(assigns(:group_event)).to eq(group_event)
      end

      it "redirects to the group_event" do
        group_event = GroupEvent.create! valid_attributes
        put :update, {:id => group_event.to_param, :group_event => valid_attributes}, valid_session
        expect(response).to redirect_to(group_event)
      end
    end

    context "with invalid params" do
      it "assigns the group_event as @group_event" do
        group_event = GroupEvent.create! valid_attributes
        put :update, {:id => group_event.to_param, :group_event => invalid_attributes}, valid_session
        expect(assigns(:group_event)).to eq(group_event)
      end

      it "re-renders the 'edit' template" do
        group_event = GroupEvent.create! valid_attributes
        put :update, {:id => group_event.to_param, :group_event => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested group_event" do
      group_event = GroupEvent.create! valid_attributes
      expect {
        delete :destroy, {:id => group_event.to_param}, valid_session
      }.to change(GroupEvent, :count).by(-1)
    end

    it "redirects to the group_events list" do
      group_event = GroupEvent.create! valid_attributes
      delete :destroy, {:id => group_event.to_param}, valid_session
      expect(response).to redirect_to(group_events_url)
    end
  end

end