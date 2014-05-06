class BiblioForm
  include ActiveModel::Model

  attr_accessor :state

  def initialize(attributes={})
    super
    @state = @state.try(:to_i) || LentHistory::LENDABLE
  end

  def state_name
    return "貸出中" if @state == LentHistory::OUT
    return "貸出可能" if @state == LentHistory::LENDABLE
  end

  def search
    return Biblio.out if state.to_i == LentHistory::OUT
    return Biblio.lendable if state.to_i == LentHistory::LENDABLE
    Biblio.lendable
  end
end
