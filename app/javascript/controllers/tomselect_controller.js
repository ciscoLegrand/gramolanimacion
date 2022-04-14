import TomSelect from "tom-select"
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['countriesField']
  connect(){
    this.countries()
    // this.default()
  }

  countries() {
    new TomSelect(this.countriesFieldTarget, {
      plugins: {
        remove_button:{
          title:'Remove this item',
        }
      },
      placeholder: "Añadir",
      hideSelected: true,
      // persist: false,
      // create: true,
      onDelete: function(values) {
        return confirm(values.length > 1 ? 'Are you sure you want to remove these ' + values.length + ' items?' : 'Are you sure you want to remove "' + values[0] + '"?');
      }
    });
  }
}
