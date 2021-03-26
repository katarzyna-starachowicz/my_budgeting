class SchemasController < ApplicationController
  def index
    @schema_id = ::Schema::Schema.first.uid
    @budget_month = Budget::BudgetMonth.find_by(schema_id: @schema_id)
    @categories_groups = ::Schema::CategoriesGroup.all.map do |categories_group|
      {
        name: categories_group.name,
        budgeted: categories_group.budgeted,
        id: categories_group.uid,
        categories: ::Schema::Category.where(categories_group_id: categories_group.uid).to_a
      }
    end
  end

  def new_categories_group
    @categories_group_id = SecureRandom.uuid
  end

  def create_categories_group
    cmd = ::Categorising::AddCategoriesGroup.new(
      schema_id: params[:schema_id],
      categories_group_id: params[:categories_group_id],
      name: params[:name],
      budgeted: params[:budgeted].eql?('true')
    )
    command_bus.(cmd)

    redirect_to schemas_path
  end

  def new_category
    @category_id  = SecureRandom.uuid
    @categories_group_id = params[:categories_group_id]
  end

  def create_category
    cmd = ::Categorising::AddCategory.new(
      schema_id: params[:schema_id],
      categories_group_id: params[:categories_group_id],
      category_id: params[:category_id],
      name: params[:name],
      budgeted: params[:budgeted].eql?('true')
    )

    command_bus.(cmd)

    redirect_to schemas_path
  end
end
