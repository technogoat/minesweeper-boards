# frozen_string_literal: true

class Boards::TableComponent < ViewComponent::Base
  renders_many :heading_columns, Boards::HeadingColumnComponent
  renders_many :body_rows, Boards::BodyRowComponent
end
