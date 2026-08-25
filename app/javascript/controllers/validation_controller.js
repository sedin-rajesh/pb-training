import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="validation"
export default class extends Controller {
  static targets = ["input", "error"]
  validate(event){
    const name = this.inputTarget.value.trim()
    if(name === ""){
      event.preventDefault()
      this.errorTarget.textContent = "Name cannot be blank."
    } else {
      this.errorTarget.textContent = ""
    }
  }
}
