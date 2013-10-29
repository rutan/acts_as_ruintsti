# encoding: UTF-8

ActiveRecord::Schema.define(version: 2) do
  create_table "blocks", force: true do |t|
    t.integer  "type"
  end
  create_table "boxes", force: true do |t|
    t.integer  "type"
  end
end
