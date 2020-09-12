module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    # A fields_for se le puede pasar el nombre del objeto (association) y el
    # objeto en sí mismo (new_object) por separado. Además, se le pasa
    # child_index para que los inputs generados tengan un id diferente a los
    # que ya están en el DOM. Por ejemplo, rails generará un fieldset con inputs
    # que tendrán id tipo 'exam_exam_associations_attributes_2_name'. El 2 en
    # ese nombre es el id. Acá se generan ids dinámicos que son el id del nuevo
    # objeto generado por rails, y cada uno es diferente.
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    # El link para agregar campos tendrá el atributo data-id="id_objeto" y
    # data-fields="" con el html que representa los nuevos campos generados con
    # el id_objeto. Javascript tomará ese HTML y lo va a renderizar antes del
    # link para agregar campos, creando los nuevos campos con el id del objeto
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
