import Swiper from "swiper"
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container", "next", "prev"]

  connect() {
    console.log('swiper_controller.js: connect()')
    this.swiper = new Swiper(this.containerTarget, {
      loop: true,
      slidesPerView: 3,
      spaceBetween: 30,
      navigation: {
        nextEl: this.nextTarget,
        prevEl: this.prevTarget,
      },
      breakpoints: {
        320: {
            slidesPerView: 1,
            spaceBetween: 10,
        },
        768: {
            slidesPerView: 2,
            spaceBetween: 20,
        },
        1243: {
            slidesPerView: 3,
            spaceBetween: 30,
        },
      },    
    })
  }
  disconnect() {
    this.containerSlider.destroy()
    this.containerSlider = undefined
  }
}