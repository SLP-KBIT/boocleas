class BiblioForm
  include ActiveModel::Model

  attr_accessor :state

  def initialize(attributes={})
    super
    @state = @state.try(:to_i) || LentHistory::LENDABLE
  end

  def search
    return Biblio.out if state.to_i == LentHistory::OUT
    return Biblio.lendable if state.to_i == LentHistory::LENDABLE
    Biblio.lendable
  end
end
