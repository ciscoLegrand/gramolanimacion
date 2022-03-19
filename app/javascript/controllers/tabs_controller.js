import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tabContent", "tabLink"]

  connect() {}
  
  hideContent() {
    let i, content, links
    content = this.tabContentTargets
    links = this.tabLinkTargets
    for (i = 0; i < content.length; i++) {
      content[i].classList.remove('block')
      content[i].classList.add('hidden')
    }    
    for (i = 0; i < links.length; i++) {
      links[i].classList.remove('text-white')
      links[i].classList.remove('bg-indigo-600')
      links[i].classList.add('text-indigo-600')
      links[i].classList.add('bg-white')
    }
  }


  displayContent(event) {
    event.preventDefault()
    this.hideContent()
    let contents = this.tabContentTargets
    let links = this.tabLinkTargets
    for (let i = 0; i < links.length; i++) {
      if (links[i].classList.contains(event.target.id)) {
        links[i].classList.add('text-white')
        links[i].classList.add('bg-indigo-600')
        links[i].classList.remove('text-indigo-600')
        links[i].classList.remove('bg-white')
      }
    }
    for (let i = 0; i < contents.length; i++) {
      if (contents[i].classList.contains(event.target.id)) {
        contents[i].classList.remove('hidden')
        contents[i].classList.add('block')
      }
    }
  }

}
