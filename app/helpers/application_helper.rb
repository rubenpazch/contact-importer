module ApplicationHelper
  class GoodnessValidator < ActiveModel::Validator
    def validate(record)
      if record.date_of_birth == "Evil"
        record.errors.add :base, "This person is evil"
      end
    end
  end
end
