import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log('hello turbo')
    // this.element.textContent = "Hello World!"
  }
}
