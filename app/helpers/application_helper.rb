module ApplicationHelper
  def object_to_table_cells(record, attrs)
    attrs.map{ |attr| record.send(attr) }
  end


  REGIONS = [
    ['Alava','Alava'],
    ['Albacete','Albacete'],
    ['Alicante', 'Alicante'],
    ['Almería', 'Almería'],
    ['Asturias', 'Asturias'],
    ['Avila','Avila'],
    ['Badajoz', 'Badajoz'],
    ['Barcelona', 'Barcelona'],
    ['Burgos', 'Burgos'],
    ['Cáceres','Cáceres'],
    ['Cádiz', 'Cádiz'],
    ['Cantabria', 'Cantabria'],
    ['Castellón', 'Castellón'],
    ['Ciudad Real', 'Ciudad Real'],
    ['Córdoba', 'Córdoba'],
    ['La Coruña', 'La Coruña'],
    ['Cuenca', 'Cuenca'],
    ['Gerona', 'Gerona'],
    ['Granada', 'Granada'],
    ['Guadalajara', 'Guadalajara'],    
    ['Guipúzcoa', 'Guipúzcoa'],
    ['Huelva', 'Huelva'],
    ['Huesca', 'Huesca'],
    ['Islas Baleares', 'Islas Baleares'],
    ['Jaén', 'Jaén'],
    ['León', 'León'],
    ['Lérida', 'Lérida'],
    ['Lugo', 'Lugo'],
    ['Madrid', 'Madrid'],
    ['Málaga', 'Málaga'],
    ['Murcia', 'Murcia'],
    ['Navarra', 'Navarra'],
    ['Orense', 'Orense'],
    ['Palencia', 'Palencia'],
    ['Las Palmas', 'Las Palmas'],
    ['Pontevedra', 'Pontevedra'],
    ['La Rioja', 'La Rioja'],
    ['Salamanca', 'Salamanca'],
    ['Segovia', 'Segovia'],
    ['Sevilla', 'Sevilla'],
    ['Soria', 'Soria'],
    ['Tarragona', 'Soria'],
    ['Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'],
    ['Teruel', 'Teruel'],
    ['Toledo', 'Toledo'],
    ['Valencia', 'Valencia'],
    ['Valladolid', 'Valladolid'],
    ['Vizcaya', 'Vizcaya'],
    ['Zamora', 'Zamora'],
    ['Zaragoza', 'Zaragoza']
  ]
    
  COMUNITES = ["Andalucía", "Aragón", "Canarias", "Cantabria", "Castilla y León", "Castilla-La Mancha", "Cataluña", "Ceuta", "Comunidad Valenciana", "Comunidad de Madrid", "Extremadura", "Galicia", "Islas Baleares", "La Rioja", "Melilla", "Navarra", "País Vasco", "Principado de Asturias", "Región de Murcia"]
  



end
