import { Controller } from "@hotwired/stimulus"
import Cookies from 'js-cookie'

export default class extends Controller {  
  static targets = ['cookiesBar', 'accept', 'reject']
  initialize() {  
    Cookies.set('main', 'clStarts!')
    console.log(Cookies.get('main'))
    console.log('cookies controller connected')

    if (this.cookiesAllowed()) {
      console.log('cookies are allowed')
      this.appendGoogleAnalyticsScript()
    }
    if (Cookies.get('allow_cookies') != undefined) {
      this.element.classList.add('hidden') 
    }

  }

  cookiesAllowed() {
    return Cookies.get('allow_cookies') === 'yes'
  }

  allowCookies(e) {
    e.preventDefault()
    console.log('cookies allowed')
    Cookies.set('allow_cookies', 'yes',{
      expires: 30
    })
    this.appendGoogleAnalyticsScript()

    this.element.classList.add('hidden')
  }

  rejectCookies(e) {
    e.preventDefault()
    console.log('cookies rejected')
    Cookies.set('allow_cookies', 'no',{
      expires: 7
    })
    this.element.classList.add('hidden')
  }

  // append code from google analytics
  appendGoogleAnalyticsScript() {
    const ga =  "(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){" +
                "(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o)," +
                "m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)" +
                "})(window,document,'script','//www.google-analytics.com/analytics.js','ga');" +
                "ga('create', 'UA-XXXXX-Y', 'auto');" + "ga('send', 'pageview');";

    document.getElementsByTagName('head')[0].append('<script>' + ga + '</script>');

  }
}

