class TypeTagsController < ApplicationController
  before_action :set_tag_collection, only: [:new] 
  before_action :set_type_tags_collection, only: [:new] 

  def new
  end

  def create
    Tag.find(params_type_tag[:tag_id]).update(type_tag_id: params_type_tag[:type_tag_id])
    redirect_to new_type_tag_path, notice: "Type tag was successfully saved"
  end

  private

    def params_type_tag
      params.require(:type_tag).permit(:tag_id, :type_tag_id)
    end
    
    def set_tag_collection
      @tags_collection = Tag.all.collect {|t| [t.name, t.id]}
    end
   
    def set_type_tags_collection
      @type_tags_collection = TypeTag.all.collect {|t| [t.type_tag_name, t.id]}
    end
end