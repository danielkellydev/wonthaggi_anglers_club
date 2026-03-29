import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  toggle() {
    this.menuTarget.classList.toggle("hidden")
  }

  show() {
    clearTimeout(this._hideTimer)
    this.menuTarget.classList.remove("hidden")
  }

  hide() {
    this._hideTimer = setTimeout(() => {
      this.menuTarget.classList.add("hidden")
    }, 150)
  }

  // Close when clicking outside
  closeOnClickOutside(event) {
    if (!this.element.contains(event.target)) {
      this.menuTarget.classList.add("hidden")
    }
  }

  connect() {
    this._outsideClick = this.closeOnClickOutside.bind(this)
    document.addEventListener("click", this._outsideClick)
  }

  disconnect() {
    clearTimeout(this._hideTimer)
    document.removeEventListener("click", this._outsideClick)
  }
}
