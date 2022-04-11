import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	static targets = [ "productfeatures" ]

	display_product_features(e) {
		e.preventDefault()
		this.productfeaturesTarget.classList.contains("hidden") ?
      this.productfeaturesTarget.classList.remove('hidden') : 
      this.productfeaturesTarget.classList.add('hidden')
	}
}