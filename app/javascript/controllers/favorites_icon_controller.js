import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorites-icon"
export default class extends Controller {
  static targets = ["color", "icon"]

  changeColor() {
    this.colorTarget.classList.toggle("listing-heart-red")

    const currentClass = this.iconTarget.classList.contains("fa-solid") ? "fa-solid" : "fa-regular"
    const newClass = currentClass === "fa-solid" ? "fa-regular" : "fa-solid"

    this.iconTarget.classList.remove(currentClass)
    this.iconTarget.classList.add(newClass)
  }

  connect() {
    console.log(this.colorTarget)
  }
}
