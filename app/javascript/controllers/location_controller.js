import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["areaSelect"];

  connect() {
    this.areaSelectTarget.disabled = true;
  }

  async filterAreas(event) {
    const location = event.target.value;
    if (location) {
      try {
        const response = await fetch(`/areas?location=${location}`);
        if (!response.ok) {
          throw new Error("Network response was not ok");
        }
        const areas = await response.json();
        this.updateAreaSelect(areas);
      } catch (error) {
        console.error("Error fetching areas:", error);
      }
    } else {
      this.updateAreaSelect([]);
    }
  }

  updateAreaSelect(areas) {
    
    let element = this.areaSelectTarget
    element.innerHTML = '<option value="">Categoría...</option>';
    areas.forEach(area => {
      const option = document.createElement("option");
      option.value = area.id;
      option.textContent = area.name;
      element.appendChild(option);
    });
    element.disabled = areas.length === 0;
  }
}