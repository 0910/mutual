ActiveAdmin.register Course do

  # ensures that the default ordering reflects our updates
  config.sort_order = "order"
  # reordering doesn't work across multiple pages,
  # so try to put everything on one page
  config.per_page   = 100

   # this filter isn't really needed
  remove_filter :order

  collection_action :reorder, method: :patch do
    reorder_params = params.require(:items).map {|item| item.permit(:id, :order) }

    reorder_ids        = reorder_params.map {|item| item[:id] }
    reorder_attributes = reorder_params.map {|item| item.slice(:order) }

    resource_class.update(reorder_ids, reorder_attributes)

    render json: { status: "success" }
  end

  controller do
    private

    def reorderable_column(dsl)
      # Don't allow reordering if filter(s) present
      # or records aren't sorted by `order`
      return if params[:q].present? || params[:order] != "order"

      dsl.column(sortable: false) do
        dsl.icon :arrows, class: "js-reorder-handle"
      end
    end

    helper_method :reorderable_column
  end

  index do
    reorderable_column(self)
    selectable_column
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
      row :picture do
        image_tag(course.picture.url(:thumb))
      end
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :title, :require => true
      f.input :description
      f.input :professor, :as => :select, :collection => Professor.all, :include_blank => false, :require => true
      f.input :google_link
    end
    f.inputs "Cover Image" do
      f.input :picture, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.picture.url(:thumb))
    end
    f.inputs "Lessons" do
      f.has_many :lessons do |i|
        i.input :qty
        i.input :price
      end 
    end
    f.actions
  end


end
