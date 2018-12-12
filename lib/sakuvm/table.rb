require "formatador"

module Sakuvm
  class Table
    def self.display(title, table_data)
      new.display(title, table_data)
    end

    def display(title, table_data)
      Formatador.display_line(title)
      Formatador.display_table(table_data)
    end
  end
end
