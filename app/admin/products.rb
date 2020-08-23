ActiveAdmin.register Product do

permit_params :id, :name, :description, :price, :full_price, :image, :status

index do
  id_column
  column :name	  
  column :price
  column :full_price
  column "image" do |img|
    image_tag (img.image.url) ,width: 50, height: 50 rescue nil
  end
  column :status
  actions
end

form do |f|
  f.inputs do
    f.input :name
    f.input :description
    f.input :full_price
    f.input :price, label: 'After Discount Price'
    f.input :image
    f.input :status, as: :select, collection: Product::STATUS.invert, include_blank: false
  end
  f.actions
end

show do
    attributes_table do
      row :name    
      row :description do |p|
        raw p.description
      end
      row :created_at
      row :updated_at
    end
    
  end
end
