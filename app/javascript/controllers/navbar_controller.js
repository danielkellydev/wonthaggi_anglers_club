import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "openIcon", "closeIcon", "heroLogo", "compactLogo"]
  static values = { homepage: { type: Boolean, default: false } }

  connect() {
    this.isOpen = false
    this.lastScrollY = window.scrollY
    this.hidden = false
    this.solid = !this.homepageValue

    this.scrollHandler = this.onScroll.bind(this)
    window.addEventListener("scroll", this.scrollHandler, { passive: true })

    this.updateAppearance()
  }

  disconnect() {
    window.removeEventListener("scroll", this.scrollHandler)
  }

  onScroll() {
    const currentScrollY = window.scrollY
    const heroThreshold = this.homepageValue ? 100 : 0

    // Background + logo swap
    if (this.homepageValue) {
      const shouldBeSolid = currentScrollY > heroThreshold
      if (shouldBeSolid !== this.solid) {
        this.solid = shouldBeSolid
        this.updateAppearance()
      }
    }

    // Hide/show navbar on scroll
    if (currentScrollY > heroThreshold + 80) {
      if (currentScrollY > this.lastScrollY && !this.hidden) {
        // Scrolling down — hide
        this.element.style.transform = "translateY(-100%)"
        if (this.hasHeroLogoTarget) {
          this.heroLogoTarget.style.opacity = "0"
          this.heroLogoTarget.style.pointerEvents = "none"
        }
        this.hidden = true
      } else if (currentScrollY < this.lastScrollY && this.hidden) {
        // Scrolling up — show with background
        this.element.style.transform = "translateY(0)"
        this.hidden = false
        if (!this.solid) {
          this.solid = true
          this.updateAppearance()
        }
      }
    } else {
      if (this.hidden) {
        this.element.style.transform = "translateY(0)"
        this.hidden = false
      }
      // Near top on homepage — restore hero logo
      if (this.homepageValue && this.hasHeroLogoTarget && !this.solid) {
        this.heroLogoTarget.style.opacity = ""
        this.heroLogoTarget.style.pointerEvents = ""
      }
    }

    this.lastScrollY = currentScrollY
  }

  updateAppearance() {
    // Background
    if (this.solid) {
      this.element.classList.add("bg-navy-950/95", "backdrop-blur-sm")
    } else {
      this.element.classList.remove("bg-navy-950/95", "backdrop-blur-sm")
    }

    // Logo swap (homepage only)
    if (this.homepageValue) {
      // Hero logo: visible at top, hidden when scrolled
      if (this.hasHeroLogoTarget) {
        if (this.solid) {
          this.heroLogoTarget.style.opacity = "0"
          this.heroLogoTarget.style.pointerEvents = "none"
        } else {
          this.heroLogoTarget.style.opacity = ""
          this.heroLogoTarget.style.pointerEvents = ""
        }
      }

      // Compact logo: hidden at top, visible when scrolled
      if (this.hasCompactLogoTarget) {
        if (this.solid) {
          this.compactLogoTarget.classList.remove("opacity-0", "pointer-events-none")
        } else {
          this.compactLogoTarget.classList.add("opacity-0", "pointer-events-none")
        }
      }
    }
  }

  toggle() {
    this.isOpen = !this.isOpen

    if (this.isOpen) {
      this.menuTarget.classList.remove("hidden")
      this.openIconTarget.classList.add("hidden")
      this.closeIconTarget.classList.remove("hidden")
    } else {
      this.menuTarget.classList.add("hidden")
      this.openIconTarget.classList.remove("hidden")
      this.closeIconTarget.classList.add("hidden")
    }
  }

  closeMenu() {
    if (this.isOpen) {
      this.toggle()
    }
  }
}
