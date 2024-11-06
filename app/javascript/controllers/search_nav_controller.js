import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-nav"
export default class extends Controller {

  connect() {
    console.log("SearchNav controller connected")
  }
}
