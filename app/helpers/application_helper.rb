module ApplicationHelper
  def object_to_table_cells(record, attrs)
    attrs.map{ |attr| record.send(attr) }
  end
end
