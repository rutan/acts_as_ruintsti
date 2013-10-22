# coding: utf-8

module ActsAsRuintsti
  module Macro
    def acts_as_ruintsti(params = {})
      self.extend ActsAsRuintsti::ClassMethods
      self.acts_as_ruintsti_params = params
    end
  end
  module ClassMethods
    @@acts_as_ruintsti_params = {}
    def acts_as_ruintsti_params=(params)
      @@acts_as_ruintsti_params = params
    end
    def sti_name
      n = @@acts_as_ruintsti_params.values.index(self.name.to_s)
      n ? @@acts_as_ruintsti_params.keys[n] : 0
    end
    def find_sti_class(type_name)
      class_name = @@acts_as_ruintsti_params[type_name.to_i]
      class_name ? class_name.constantize : self
    end
    def subclass_from_attrs(attr)
      type_num = attr.with_indifferent_access[inheritance_column]
      if type_num.present?
        subclass_name = @@acts_as_ruintsti_params[type_num]
        if subclass_name.present? && subclass_name != self.name
          subclass = subclass_name.safe_constantize
          unless descendants.include?(subclass)
            raise ActiveRecord::SubclassNotFound.new("Invalid single-table inheritance type: #{subclass_name} is not a subclass of #{name}")
          end
          subclass
        elsif subclass_name.blank?
          raise ActiveRecord::SubclassNotFound.new("Invalid single-table inheritance type number: #{type_num} is not a subclass of #{name}")
        end
      end
    end
  end
end

ActiveRecord::Base.send :extend, ActsAsRuintsti::Macro
