import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dialog"
export default class extends Controller {
  static targets = ["content"]
  static values = {
    open: {
      type: Boolean,
      default: false
    },
  }

  connect() {
    if (this.openValue) {
      this.open()
    }
  }

  open(e) {
    if(e !== undefined) e.preventDefault()
    // todo: check if the element is already open
    document.querySelectorAll('div[data-controller="ruby-ui--dialog"]:not(#doctor_form')
      .forEach(function (elem) { elem.remove() })
    document.body.insertAdjacentHTML('beforeend', this.contentTarget.innerHTML)
    // prevent scroll on body
    document.body.classList.add('overflow-hidden')
  }

  dismiss() {
    // allow scroll on body
    document.body.classList.remove('overflow-hidden')
    // remove the element
    this.element.remove()
  }
}
