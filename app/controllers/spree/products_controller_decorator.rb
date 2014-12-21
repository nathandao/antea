module ProductsControllerExtensions
  def show
    super
    supply_taxonomies
  end

  protected

  def supply_taxonomies
    @taxonomies = Spree::Taxonomy.includes(root: :children)
  end
end

Spree::ProductsController.class_eval do
  prepend ProductsControllerExtensions
end