class BiblioForm
  include ActiveModel::Model

  attr_accessor :state, :title

  def initialize(attributes={})
    super
    @state = @state.try(:to_i) || LentHistory::LENDABLE
  end

  def state_name
    return "貸出中" if @state == LentHistory::OUT
    return "貸出可能" if @state == LentHistory::LENDABLE
  end

  def search
    p search_form_state: @state
    biblios = Biblio.out if state == LentHistory::OUT
    biblios = Biblio.lendable if state == LentHistory::LENDABLE
    biblios = biblios.select { |bib| bib.book.title.include? @title } if @title
    biblios
  end
end
