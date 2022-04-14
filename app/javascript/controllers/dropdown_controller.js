import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	static targets = [ "productfeatures", 'mobilemenu' ]

	display_menu(e) {
		console.log('holamundo')
		e.preventDefault()
		this.mobilemenuTarget.classList.contains("hidden") ?
			this.mobilemenuTarget.classList.remove("hidden") :
			this.mobilemenuTarget.classList.add("hidden")
	}

	display_product_features(e) {
		e.preventDefault()
		this.productfeaturesTarget.classList.contains("hidden") ?
      this.productfeaturesTarget.classList.remove('hidden') : 
      this.productfeaturesTarget.classList.add('hidden')
	}
}