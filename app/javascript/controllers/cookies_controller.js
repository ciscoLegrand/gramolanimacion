import { Controller } from "@hotwired/stimulus"
import Cookies from 'js-cookie'

export default class extends Controller {  
  static targets = ['cookiesBar']
  connect() {  
    Cookies.set('main', 'clStarts!', { expires: 7 })
    console.log(Cookies.get('main'))
  }

  acceptCookies(e) {
    e.preventDefault()
    Cookies.set('main', 'clTemplate accepted', { expires: 7 })
    this.element.classList.add('invisible')
    console.log('click on accept button')
  }
  
  rejectCookies(e) {
    e.preventDefault()
    Cookies.remove('main')
    this.element.classList.add('invisible')
    console.log('click on reject button')
  }
}

