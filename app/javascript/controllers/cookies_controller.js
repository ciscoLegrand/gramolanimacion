import { Controller } from "@hotwired/stimulus"
import Cookies from 'js-cookie'

export default class extends Controller {  
  static targets = ['cookiesBar']
  connect() {  
    Cookies.set('main', 'clStarts!')
    console.log(Cookies.get('main'))
  }

  acceptCookies(e) {
    e.preventDefault()
    Cookies.set('main', 'clTemplate accepted', { expires: 7 })
    Cookies.set('allow_cookies', 'true') // application.html.erb display control cookies_bar
    this.element.classList.add('invisible')
    console.log(`click on accept button hide bar and set ${Cookies.get('main')} && ${Cookies.get('allow_cookies')}`)
  }
  
  rejectCookies(e) {
    e.preventDefault()
    Cookies.set('allow_cookies', 'false') // application.html.erb display control cookies_bar
    Cookies.remove('main')
    this.element.classList.add('invisible')
    console.log(`click on reject button hide bar and set ${Cookies.get('main')} && ${Cookies.get('allow_cookies')}`)
  }
}

