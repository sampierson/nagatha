class TodoItem < ActiveRecord::Base
  belongs_to :user
  acts_as_list :scope => :user

  validates_presence_of :description
  validates_presence_of :user_id, :message => I18n.t('errors.must_be_supplied')

  state_machine :status, :initial => 'undone' do
    event(:done) { transition 'undone' => 'done' }
  end

  class << self
    def search(search)
      if search
        where('description LIKE ?', "%#{search}%")
      else
        scoped
      end
    end
  end
end
