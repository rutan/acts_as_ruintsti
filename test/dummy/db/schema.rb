# encoding: UTF-8

ActiveRecord::Schema.define(version: 1) do
  create_table "blocks", force: true do |t|
    t.integer  "type"
  end
end
