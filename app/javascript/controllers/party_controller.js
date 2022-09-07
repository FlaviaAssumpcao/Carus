import { Controller } from "@hotwired/stimulus"
import party from "party-js";
// Connects to data-controller="party"
export default class extends Controller {
  connect() {
    party.confetti(this.element);
  }
}
