import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  open() {
    console.log("The modal has been opened!");
    this.element.classList.remove("invisible");
  }
  close() {
    console.log("The modal has been closed!");
    this.element.classList.add("invisible");
  }
}