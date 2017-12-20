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

RSpec.describe AuthorsController, type: :controller do
  login_user

  # This should return the minimal set of attributes required to create a valid
  # Author. As you add validations to Author, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {"name": "Author1"}
  }

  let(:invalid_attributes) {
    {name: ""}
  }


  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AuthorsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all authors as @authors" do
      author = Author.create! valid_attributes
      get :index
      expect(assigns(:authors)).to eq([author])
    end
  end

  describe "GET #show" do
    it "assigns the requested author as @author" do
      author = Author.create! valid_attributes
      get :show, id: author.to_param
      expect(assigns(:author)).to eq(author)
    end
  end

  describe "GET #new" do
    it "assigns a new author as @author" do
      get :new
      expect(assigns(:author)).to be_a_new(Author)
    end
  end

  describe "GET #edit" do
    it "assigns the requested author as @author" do
      author = Author.create! valid_attributes
      get :edit, id: author.to_param
      expect(assigns(:author)).to eq(author)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Author" do
        expect {
          post :create, author: valid_attributes
        }.to change(Author, :count).by(1)
      end

      it "assigns a newly created author as @author" do
        post :create, author: valid_attributes
        expect(assigns(:author)).to be_a(Author)
        expect(assigns(:author)).to be_persisted
      end

      it "redirects to the created author" do
        post :create, author: valid_attributes
        expect(response).to redirect_to(Author.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved author as @author" do
        post :create, author: invalid_attributes
        expect(assigns(:author)).to be_a_new(Author)
      end

      it "re-renders the 'new' template" do
        post :create, author: invalid_attributes
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: "Author2"}
      }

      it "updates the requested author" do
        author = Author.create! valid_attributes
        put :update, {id: author.to_param, author: new_attributes}
        author.reload
        expect(author.name).to eq(new_attributes[:name])
      end

      it "assigns the requested author as @author" do
        author = Author.create! valid_attributes
        put :update, {id: author.to_param, author: valid_attributes}
        expect(assigns(:author)).to eq(author)
      end

      it "redirects to the author" do
        author = Author.create! valid_attributes
        put :update, {id: author.to_param, author: valid_attributes}
        expect(response).to redirect_to(author)
      end
    end

    context "with invalid params" do
      it "assigns the author as @author" do
        author = Author.create! valid_attributes
        put :update, {id: author.to_param, author: invalid_attributes}
        expect(assigns(:author)).to eq(author)
      end

      it "re-renders the 'edit' template" do
        author = Author.create! valid_attributes
        put :update, {id: author.to_param, author: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested author" do
      author = Author.create! valid_attributes
      expect {
        delete :destroy, id: author.to_param
      }.to change(Author, :count).by(-1)
    end

    it "redirects to the authors list" do
      author = Author.create! valid_attributes
      delete :destroy, id: author.to_param
      expect(response).to redirect_to(authors_url)
    end
  end

end
