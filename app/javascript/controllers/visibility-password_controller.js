import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["unhide"]
  toggle(e){
    var password_field = $(e.currentTarget).closest("span").prev("input")[0]
    var icon = $(e.currentTarget).closest("a")[0];

    
    if (password_field.type == 'password') {
      icon.classList.remove('fa-eye-slash');
      icon.classList.add('fa-eye');
      password_field.type = 'text'
    } else {
      icon.classList.remove('fa-eye');
      icon.classList.add('fa-eye-slash');      
      password_field.type = 'password'

    }
    
  }
}
