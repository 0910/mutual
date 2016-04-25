ActiveAdmin.register Professor do

  index do
    column :id
    column :name
    actions
  end
  
  show do |p|
    attributes_table do
      row :name
      row :bio
      row :email
      row :has_car
      row :has_location
      row :province
      row :picture do
        image_tag(professor.picture.url(:thumb))
      end
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :bio
      f.input :email
      f.input :has_car, :as => :select, :collection => ['No', 'Yes'], :include_blank => false
      f.input :has_location, :as => :select, :collection => ['No', 'Yes'], :include_blank => false
      f.input :province
    end
    f.inputs "Profile picture" do
      f.input :picture, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.picture.url(:thumb))
    end
    f.actions
  end

end
