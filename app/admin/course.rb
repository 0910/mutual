ActiveAdmin.register Course do

  index do
    column :id
    column :title
    column :professor
    column 'Available', :sortable => :available do |resource|
      column_select(resource, :available, ["Yes", "No"])
    end
    actions
  end
  
  show do |p|
    attributes_table do
      row :title
      row :description
      row :professor
      row :lessons
      row :google_link
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :title, :require => true
      f.input :description
      f.input :professor, :as => :select, :collection => Professor.all, :include_blank => false, :require => true
      f.input :lessons
    end
    f.actions
  end


end
