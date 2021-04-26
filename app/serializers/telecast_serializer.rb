class TelecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id

  attributes :title, :min, :max
end
