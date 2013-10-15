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
  end
end

ActiveRecord::Base.send :extend, ActsAsRuintsti::Macro
