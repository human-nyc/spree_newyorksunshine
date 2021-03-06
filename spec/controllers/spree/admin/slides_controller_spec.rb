require 'spec_helper'

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

describe Spree::Admin::SlidesController do

  # This should return the minimal set of attributes required to create a valid
  # Spree::Admin::Slide. As you add validations to Spree::Admin::Slide, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Spree::Admin::SlidesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all spree_admin_slides as @spree_admin_slides" do
      slide = Spree::Admin::Slide.create! valid_attributes
      get :index, {}, valid_session
      assigns(:spree_admin_slides).should eq([slide])
    end
  end

  describe "GET show" do
    it "assigns the requested spree_admin as @spree_admin" do
      slide = Spree::Admin::Slide.create! valid_attributes
      get :show, {:id => slide.to_param}, valid_session
      assigns(:spree_admin).should eq(slide)
    end
  end

  describe "GET new" do
    it "assigns a new spree_admin as @spree_admin" do
      get :new, {}, valid_session
      assigns(:spree_admin).should be_a_new(Spree::Admin::Slide)
    end
  end

  describe "GET edit" do
    it "assigns the requested spree_admin as @spree_admin" do
      slide = Spree::Admin::Slide.create! valid_attributes
      get :edit, {:id => slide.to_param}, valid_session
      assigns(:spree_admin).should eq(slide)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Spree::Admin::Slide" do
        expect {
          post :create, {:spree_admin => valid_attributes}, valid_session
        }.to change(Spree::Admin::Slide, :count).by(1)
      end

      it "assigns a newly created spree_admin as @spree_admin" do
        post :create, {:spree_admin => valid_attributes}, valid_session
        assigns(:spree_admin).should be_a(Spree::Admin::Slide)
        assigns(:spree_admin).should be_persisted
      end

      it "redirects to the created spree_admin" do
        post :create, {:spree_admin => valid_attributes}, valid_session
        response.should redirect_to(Spree::Admin::Slide.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved spree_admin as @spree_admin" do
        # Trigger the behavior that occurs when invalid params are submitted
        Spree::Admin::Slide.any_instance.stub(:save).and_return(false)
        post :create, {:spree_admin => {  }}, valid_session
        assigns(:spree_admin).should be_a_new(Spree::Admin::Slide)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Spree::Admin::Slide.any_instance.stub(:save).and_return(false)
        post :create, {:spree_admin => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested spree_admin" do
        slide = Spree::Admin::Slide.create! valid_attributes
        # Assuming there are no other spree_admin_slides in the database, this
        # specifies that the Spree::Admin::Slide created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Spree::Admin::Slide.any_instance.should_receive(:update).with({ "these" => "params" })
        put :update, {:id => slide.to_param, :spree_admin => { "these" => "params" }}, valid_session
      end

      it "assigns the requested spree_admin as @spree_admin" do
        slide = Spree::Admin::Slide.create! valid_attributes
        put :update, {:id => slide.to_param, :spree_admin => valid_attributes}, valid_session
        assigns(:spree_admin).should eq(slide)
      end

      it "redirects to the spree_admin" do
        slide = Spree::Admin::Slide.create! valid_attributes
        put :update, {:id => slide.to_param, :spree_admin => valid_attributes}, valid_session
        response.should redirect_to(slide)
      end
    end

    describe "with invalid params" do
      it "assigns the spree_admin as @spree_admin" do
        slide = Spree::Admin::Slide.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Spree::Admin::Slide.any_instance.stub(:save).and_return(false)
        put :update, {:id => slide.to_param, :spree_admin => {  }}, valid_session
        assigns(:spree_admin).should eq(slide)
      end

      it "re-renders the 'edit' template" do
        slide = Spree::Admin::Slide.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Spree::Admin::Slide.any_instance.stub(:save).and_return(false)
        put :update, {:id => slide.to_param, :spree_admin => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested spree_admin" do
      slide = Spree::Admin::Slide.create! valid_attributes
      expect {
        delete :destroy, {:id => slide.to_param}, valid_session
      }.to change(Spree::Admin::Slide, :count).by(-1)
    end

    it "redirects to the spree_admin_slides list" do
      slide = Spree::Admin::Slide.create! valid_attributes
      delete :destroy, {:id => slide.to_param}, valid_session
      response.should redirect_to(spree_admin_slides_url)
    end
  end

end
