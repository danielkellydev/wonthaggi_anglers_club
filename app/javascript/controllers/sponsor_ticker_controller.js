import { Controller } from "@hotwired/stimulus"

// Infinite scrolling sponsor logo ticker
// Duplicates the logo list so the scroll loops seamlessly
export default class extends Controller {
  static targets = ["track"]

  connect() {
    // Duplicate the logos for seamless infinite scroll
    const track = this.trackTarget
    track.innerHTML += track.innerHTML

    // Pause on hover
    this.element.addEventListener("mouseenter", () => {
      track.style.animationPlayState = "paused"
    })
    this.element.addEventListener("mouseleave", () => {
      track.style.animationPlayState = "running"
    })

    // Respect reduced motion
    if (window.matchMedia("(prefers-reduced-motion: reduce)").matches) {
      track.style.animationPlayState = "paused"
    }
  }
}
