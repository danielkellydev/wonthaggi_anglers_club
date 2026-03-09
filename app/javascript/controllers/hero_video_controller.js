import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["video"]

  connect() {
    this.prefersReducedMotion = window.matchMedia("(prefers-reduced-motion: reduce)")

    if (this.prefersReducedMotion.matches) {
      this.videoTarget.pause()
      return
    }

    this.prefersReducedMotion.addEventListener("change", this.handleMotionChange)

    this.observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          this.videoTarget.play()
        } else {
          this.videoTarget.pause()
        }
      },
      { threshold: 0.25 }
    )

    this.observer.observe(this.element)
  }

  disconnect() {
    this.observer?.disconnect()
    this.prefersReducedMotion?.removeEventListener("change", this.handleMotionChange)
  }

  handleMotionChange = (e) => {
    if (e.matches) {
      this.videoTarget.pause()
    } else {
      this.videoTarget.play()
    }
  }
}
