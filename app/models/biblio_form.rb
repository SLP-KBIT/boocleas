class BiblioForm
  include ActiveModel::Model

  attr_accessor :state, :keyword

  def initialize(attributes={})
    super
    @state = @state.try(:to_i) || LentHistory::LENDABLE
  end

  def state_name
    return "貸出中" if @state == LentHistory::OUT
    return "貸出可能" if @state == LentHistory::LENDABLE
  end

  def search
    biblios = Biblio.out if state == LentHistory::OUT
    biblios = Biblio.lendable if state == LentHistory::LENDABLE
    biblios = biblios.select { |bib| bib.is_contain? @keyword } if @keyword
    biblios
  end
end
