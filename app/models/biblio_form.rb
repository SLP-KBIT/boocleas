class BiblioForm
  include ActiveModel::Model

  attr_accessor :state, :keyword, :isbn

  def initialize(attributes={})
    @state = @state.try(:to_i) || LentHistory::LENDABLE
    return nil if attributes.nil?
    @keyword = attributes[:keyword].presence
    @isbn = attributes[:isbn].presence
  end

  def state_name
    return "貸出中" if @state == LentHistory::OUT
    return "貸出可能" if @state == LentHistory::LENDABLE
  end

  def search
    return search_by_isbn @isbn if @isbn
    return search_by_filter
  end

  private

  def search_by_filter
    p in_search_by_filter: true
    biblios = Biblio.out if @state == LentHistory::OUT
    biblios = Biblio.lendable if @state == LentHistory::LENDABLE
    p after_state: biblios
    biblios = biblios.select { |bib| bib.is_contain? @keyword } if @keyword
    Array(biblios)
  end

  def search_by_isbn
    Book.where(isbn: @isbn).map(&:biblios).flatten
  end
end
