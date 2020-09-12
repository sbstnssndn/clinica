// No se usa $(document).ready() porque turbolinks no carga el documento de
// de nuevo, sino que sólo trae los HTML correspondientes, así que no funciona
// correctamente de esa forma. En vez de eso, se le añade el handler al document
// para el evento click a todos los elementos actuales y futuros con cierto
// criterio que habrá en el DOM (e.g. que tengan clase remove_fields/add_fields)
const documentSelector = $(document);

// Se le añade un handler para el evento click a todos los elementos (actuales
// o futuros [i.e. que aún no existen]) con la clase remove_fields, a partir
// del elemento raíz (en este caso, el documento)
documentSelector.on('click', '.remove_fields', function() {
  // 'this' acá es el nodo con clase remove_fields.
  // se le asigna el valor '1' al hermano que precede inmediatamente al nodo
  // con clase remove_fields y que es un input de tipo hidden
  $(this).prev('input[type=hidden]').val('1');
  // A partir del nodo con clase remove_fields, se busca hacia arriba en el
  // árbol del DOM hasta que se encuentra un elemento que sea un fieldset
  // luego, se esconde dicho elemento
  $(this).closest('fieldset').hide();
});

// Esta vez se captura el evento click (e) para prevenir que el link con clase
// add_fields tenga su comportamiento normal (con preventDefault).
documentSelector.on('click', '.add_fields', function(e) {
  time = new Date().getTime();
  // 'this' es el link con clase add_fields dentro del form
  regexp = new RegExp($(this).data('id'), 'g');
  // el link para agregar campos tiene el atributo data-fields="" y contiene
  // el HTML para generar dichos campos. Lo que se hace, es reemplazar
  // data-id="" dentro de dicho string HTML por la hora actual, y renderizarlo
  // antes del link para agregar campos
  console.log($(this))
  $(this).before($(this).data('fields').replace(regexp, time));
  e.preventDefault();
});
